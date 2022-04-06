//
//  BackGradient.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 30.03.2022.
//

import UIKit


extension CharactersViewController {
    func navigationBar() {
        // Navihation bar color
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.78767699, green: 0.949904263, blue: 0.7201433778, alpha: 1)

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .black
    }
}

