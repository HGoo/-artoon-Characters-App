//
//  CharactersViewController.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 05.03.2022.
//

import UIKit

class CharactersViewController: UITableViewController {

    var jsonUrlRaM = "https://rickandmortyapi.com/api/character"
    
    var jsonCountCharacters: Character?
    
    private var characters: [DetailResult]?
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
                
        let character = (characters?[indexPath.row])
        cell.configure(with: character)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

        
    func fetchDataRaM() {

        guard let url = URL(string: jsonUrlRaM ) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            do {
                self.characters = try JSONDecoder().decode([DetailResult].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print(self.characters ?? "Error characters")
            } catch let error {
                print(error)
            }
        }.resume()
        
    }

}
