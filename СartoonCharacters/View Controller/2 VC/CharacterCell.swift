//
//  TableViewCell.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 05.03.2022.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    @IBOutlet var imageInCell: ImageView!
    @IBOutlet var nameCell: UILabel!
    @IBOutlet var status: UILabel!
    @IBOutlet var idChar: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    var index: IndexPath!
    var indexAsync: IndexPath?
    var character: DetailResult?

    
    func configure(with character: DetailResult?, _ index: IndexPath) {
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        imageInCell.image = nil
        
        guard let character = character else { return }
        nameCell.text = character.name
        status.text = character.name
        idChar.text = "\(character.id ?? 0)"
        
        self.index = index
        self.character = character
        
        
        
        imageInCell.fetchImage(with: character) { [weak self] response in
            
            self?.indexAsync = index
            self?.equals(response)
        }
        
        UITableView().reloadData()

        if imageInCell.image != nil {
            activityIndicator.stopAnimating()
        }
            }
    
    func equals(_ image: UIImage) {
        if self.indexAsync?.row == self.index.row {
            self.imageInCell.image = image
            activityIndicator.stopAnimating()
            UITableView().reloadRows(at: [index], with: .automatic)
        }
    }
}
