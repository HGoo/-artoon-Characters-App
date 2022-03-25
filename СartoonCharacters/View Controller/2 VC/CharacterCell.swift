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
    
    
    func configure(with character: DetailResult?) {
        guard let character = character else { return }
        nameCell.text = character.name
    
        imageInCell.fetchImage(wuth: character.image)
    }

}
