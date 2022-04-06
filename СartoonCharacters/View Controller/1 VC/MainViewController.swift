//
//  MainViewController.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 05.03.2022.
//

import UIKit

enum Cartoons: String, CaseIterable {
    case rickAndMorty = "Rick And Morty"
    case simpsons = "Simpsons"
}

class MainViewController: UICollectionViewController {
    
    let cartons = Cartoons.allCases
    let logoImage = Image()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar()
    }
        
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
        case .simpsons:
            performSegue(withIdentifier: "simpsons", sender: self)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "rickAndMorty":
            let characterRaMVC = segue.destination as! CharactersViewController
            characterRaMVC.fetchCountCharachters()
        case "simpsons":
            let characterSimpVC = segue.destination as! SimpsonsViewController
            characterSimpVC.fetchDataSimpsons()
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

