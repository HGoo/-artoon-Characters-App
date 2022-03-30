//
//  SimpsonsViewController.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 30.03.2022.
//

import UIKit

class SimpsonsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var image: ImageViewSimps!
    @IBOutlet var refreshButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar()
    }
    
    
    

}
