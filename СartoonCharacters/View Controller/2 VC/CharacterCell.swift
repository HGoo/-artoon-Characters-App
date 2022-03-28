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
    
    private weak var task: URLSessionTask?
    
    var character: DetailResult!
    var celltag: Int!
    
    func configure(with character: DetailResult?, _ celltag: Int) {
        guard let character = character else { return }
        nameCell.text = character.name
        status.text = character.name
        idChar.text = "\(character.id ?? 0)"
        
        
        self.character = character
        self.celltag = celltag
        imageInCell.fetchImage(with: character, celltag)
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        if celltag + 1 != character.id {
//        task?.cancel()
//        }
//        
//        imageInCell.fetchImage(with: character , celltag)
//    }

    
}
