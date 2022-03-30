//
//  BackColorSim.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 30.03.2022.
//

import UIKit

extension SimpsonsViewController {
    func navigationBar() {
        // Navihation bar color
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 1, green: 0.8634051085, blue: 0.3803275824, alpha: 1)

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .black
    }
}
