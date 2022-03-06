//
//  TableViewCell.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 05.03.2022.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet var imageInCell: UIImageView!
    @IBOutlet var nameCell: UILabel!
    
    
    func configure(with character: Character) {
        print("2222222222")
        //nameCell.text = character.results
       
        print("3333333, \(character)")
        
        for i in character.results {
            nameCell.text = i.name
            
        }
        
        
        
//        DispatchQueue.global().async {
//            guard let imageUrl = URL(string: character.image!) else { return }
//            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
//           
//            DispatchQueue.main.async {
//                self.imageInCell.image = UIImage(data: imageData)
//            }
//        }
    }

}
