//
//  CharactersViewController.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 05.03.2022.
//

import UIKit

class CharactersViewController: UITableViewController {
    
    // MARK: - Publick Properties
    var jsonUrlRaM = "https://rickandmortyapi.com/api/character"
    var jsonCountCharacters: Character?
    
    // MARK: - Private Properties
    private var characters: [DetailResult]?
  
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar()
        
        tableView.separatorStyle = .none
    }
    
    // MARK: - Table View Data Sourse
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        
        cell.tag = indexPath.row
        
        let character = (characters?[indexPath.row])
        cell.configure(with: character, indexPath)
   
        return cell
        
       
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
   
    // MARK: - Methods
    func fetchDataRaM() {
        
        guard let url = URL(string: jsonUrlRaM) else { return }
        
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
