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
    
    
    func configure(with character: DetailResult?) {
        guard let character = character else { return }
        nameCell.text = character.name
        status.text = character.status
        idChar.text = "\(character.id ?? 0)"
        
    
        imageInCell.fetchImage(with: character)
       
    }

}
