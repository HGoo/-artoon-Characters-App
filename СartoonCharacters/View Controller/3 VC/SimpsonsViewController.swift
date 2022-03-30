//
//  SimpsonsViewController.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 30.03.2022.
//

import UIKit

class SimpsonsViewController: UIViewController {
    
    private let jsonSimpsons = "https://thesimpsonsquoteapi.glitch.me/quotes?count=1"
    private var character: [CharacterInfoSimps]?
    
    // MARK: - IBOutlets
    @IBOutlet var imageHolder: ImageViewSimps!
    @IBOutlet var refreshButton: UIButton!
   
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchDataSimpsons()
        
       
        ImageViewSimps().fetchImage(with: character?[0].image ?? "") { image in
            if self.imageHolder.image != nil {
                self.imageHolder.image = image
            }
        }
        
            
        navigationBar()
        
    }
    
    // MARK: - Methods
    func fetchDataSimpsons() {
        
        guard let url = URL(string: jsonSimpsons) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, _ in
            guard let data = data, let response = response else { return }
            
            do {
                self.character = try JSONDecoder().decode([CharacterInfoSimps].self, from: data)
                DispatchQueue.main.async {
                    
                }
                ImageViewSimps().saveImageToCache(data: data, response: response)
                print("Lod in cach")
                
                print(self.character ?? "Error characters")
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    
    

}
