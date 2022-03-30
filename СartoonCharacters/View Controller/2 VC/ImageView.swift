//
//  ImageView.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 17.03.2022.
//

import UIKit

class ImageView: UIImageView {
    
    func fetchImage(with urls: DetailResult, _ completion: @escaping (UIImage) -> ()) {
        guard let url = urls.image else { return }
        guard let imageUrl = url.getURL() else {
            image = UIImage(named: "notFound")
            return
        }
            
        if let cachedImage = self.getCachedImage(url: imageUrl) {
            self.image = cachedImage
            print("99999999999999999999")

            return
            
        }
        
        URLSession.shared.dataTask(with: imageUrl) { [weak self] data, response, error in
            if let error = error { print(error); return }

            guard let self = self else { return }
            guard let data = data, let response = response else { return }
            guard let responseURL = response.url else {  return }

            if responseURL.absoluteString != url { return }
            
            DispatchQueue.main.async {
                print("00000000000000000000")
                guard let image = UIImage(data: data) else { return }
                completion(image)
            }
            
            self.saveImageToCache(data: data, response: response)

        }.resume()
    }
   
    func saveImageToCache(data: Data, response: URLResponse) {
        guard let responseURL = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
    }
    
    func getCachedImage(url: URL) -> UIImage? {
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            return UIImage(data: cachedResponse.data)
        }
        return nil
    }
    
    
}


fileprivate extension String{
    func getURL() -> URL? {
        guard let url = URL(string: self) else { return nil }
        return url
    }
}
