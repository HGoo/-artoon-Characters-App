//
//  MainViewController.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 05.03.2022.
//

import UIKit

enum Cartoons: String, CaseIterable {
    case rickAndMorty = "Rick And Morty"
    case def1 = "No name1"
    case def2 = "No name2"
    case def3 = "No name3"
    case def4 = "No name4"
    case def5 = "No name5"
    case def6 = "No name6"
    case def7 = "No name7"
    case def8 = "No name8"
}

class MainViewController: UICollectionViewController {
    
    let cartons = Cartoons.allCases
    let logoImage = Image()
        
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cartons.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell
        
        cell.characterActionImage.image = UIImage(named: logoImage.image[indexPath.row])
        
        return cell
        
    }
    
    // MARK: - UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = cartons[indexPath.item]
      
        
    
        switch userAction {
        case .rickAndMorty:
            performSegue(withIdentifier: "rickAndMorty", sender: self)
        default: break
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let characterVC = segue.destination as! CharactersViewController
        
        switch segue.identifier {
        case "rickAndMorty":
            characterVC.fetchCountCharachters()
            
        default: break
        }
    }
    
    
}

// MARK: - CollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width - 28, height: 100)
    }
}

