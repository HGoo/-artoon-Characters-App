//
//  BackColorMain.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 30.03.2022.
//


import UIKit

extension MainViewController {
    
    func navigationBar() {
        // Navihation bar color
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 1, green: 0.8719091415, blue: 0.8022434115, alpha: 1)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .black
    }
}
