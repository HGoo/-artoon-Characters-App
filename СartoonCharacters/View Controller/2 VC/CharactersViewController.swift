//
//  CharactersViewController.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 05.03.2022.
//

import UIKit

class CharactersViewController: UITableViewController {

    private let jsonUrlRaM = "https://rickandmortyapi.com/api/character"
    private var characters: Character?
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters?.results?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        
        let character = (characters?.results?[indexPath.row])
        cell.configure(with: character ?? 0)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

        
    func fetchDataRaM() {

        guard let url = URL(string: jsonUrlRaM) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            do {
                self.characters = try JSONDecoder().decode(Character.self, from: data)
                //let character = try JSONDecoder().decode(Character.self, from: data)
                print(self.characters ?? "22")
            } catch let error {
                print(error)
            }
        }.resume()
        
    }

}
