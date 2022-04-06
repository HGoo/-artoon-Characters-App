//
//  SimpsonsViewController.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 30.03.2022.
//

import UIKit
import CoreData

class SimpsonsViewController: UIViewController {
    
    var tasks: [Task] = []
    
    // MARK: - Private Methods
    private let manageContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private let jsonSimpsons = "https://thesimpsonsquoteapi.glitch.me/quotes?count=50"
    private var character: [CharacterInfoSimps]?
    private var input = 0
    
    // MARK: - IBOutlets
    @IBOutlet var imageHolder: ImageViewSimps!
    @IBOutlet var quoteCharLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        quoteCharLabel.isHidden = true
        navigationBar()
        
    }
    
    // MARK: - IBActions
    @IBAction func refreshPresed(_ sender: UIButton) {
        sender.pulse()
        upgradeImage()
    }
    
    // MARK: - Methods
    func fetchDataSimpsons() {
        
        guard let url = URL(string: jsonSimpsons) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, _ in
            guard let data = data else { return }
            
            do {
                self.character = try JSONDecoder().decode([CharacterInfoSimps].self, from: data)
                DispatchQueue.main.async {
                    self.upgradeImage()
                }
                print("Lod in cach")
                
                print(self.character ?? "Error characters")
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func upgradeImage() {
        
        ImageViewSimps().fetchImage(with: character?[input].image ?? "") { image in
            self.imageHolder.image = image
            self.activityIndicator.stopAnimating()
        }
        quoteCharLabel.isHidden = false
        quoteCharLabel.text = character?[input].quote
        
        if input == (character?.count ?? 1) - 1 { input = 0 }
        input += 1
    }
}
