//
//  ImageView.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 30.03.2022.
//

import UIKit

class ImageViewSimps: UIImageView {
    
    func fetchImage(with url: String, _ comlition: @escaping (UIImage) -> ()) {
            guard let imageUrl = url.getURL() else {
            image = UIImage(named: "notFound")
            return
        }
        if let cachedImage = self.getCachedImage(url: imageUrl) {
            self.image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            if let error = error { print(error); return }
            guard let data = data, let response = response else { return }
            
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else { return }
                comlition(image)
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



