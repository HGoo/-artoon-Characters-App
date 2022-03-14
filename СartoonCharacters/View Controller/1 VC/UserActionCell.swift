//
//  UserActionCellCollectionViewCell.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 05.03.2022.
//

import UIKit

class UserActionCell: UICollectionViewCell {

    @IBOutlet var characterActionImage: UIImageView!
    
}

extension UserActionCell {
    
    func pulsete() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        
        pulse.fromValue = 0.95
        pulse.toValue = 1
        
        layer.add(pulse, forKey: nil)
    }
  
}
