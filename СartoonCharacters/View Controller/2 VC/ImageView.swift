//
//  ImageView.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 17.03.2022.
//

import UIKit

class ImageView: UIImageView {
    
    func fetchImage( wuth url: String?){
        image = UIImage(named: "notFound")
        guard let url = url else { return }
        guard let imageUrl = url.getURL() else {
            image = UIImage(named: "notFound")
            return
        }
        
        if let cachedImage = getCachedImage(url: imageUrl) {
            image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { [weak self] data, response, error in
            if let error = error { print(error); return }
            guard let self = self else { return }
            guard let data = data, let response = response else { return }
            guard let responseURL = response.url else {  return }
            
            if responseURL.absoluteString != url { return }
            
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }

                self.image = UIImage(data: data)
            }

            
            self.saveImageToCache(data: data, response: response)
            
        }.resume()
    }
    
   
    private func saveImageToCache(data: Data, response: URLResponse) {
        guard let responseURL = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
    }
    
    private func getCachedImage(url: URL) -> UIImage? {
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
