//
//  Extention all charactrers RAM.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 20.03.2022.
//

import Foundation

extension CharactersViewController {

    func fetchCountCharachters() {
        guard let url = URL(string: jsonUrlRaM ) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            do {
                self.jsonCountCharacters = try JSONDecoder().decode(Character.self, from: data)
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.getUrlCount()
                }
                print(self.jsonCountCharacters ?? "")
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func getUrlCount() {
        
        guard let countChar = jsonCountCharacters?.info?.count else { return }
        var finalStringURL = jsonUrlRaM + "/"
        
        for char in 1...(countChar) {
            if char != countChar {
                finalStringURL += String(char) + ","
            } else {
                finalStringURL += String(char)
            }
        }
    
        jsonUrlRaM = finalStringURL
        
        fetchDataRaM()
        
    }
}
