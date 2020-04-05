//
//  ViewController.swift
//  pockemongetdaze
//
//  Created by 安部学 on 2020/04/04.
//  Copyright © 2020 Manabu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchText.delegate = self
        
        searchText.placeholder = "ポケモンの名前を入力するのだ！"
        
        
    }
    @IBOutlet weak var searchText: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        view.endEditing(true)
        
        if let searchWord = searchBar.text {
            print(searchWord)
            
            searchPockemon(keyword: searchWord)
        }
        
    }
    
    struct ItemJson: Codable {
        
        let no: Int?
        
        let name: String?
        
        let form: String?
        
        let isMegaEvolution: Bool?
        
        let evolutions: Int?
        
        let types: String?
        
        let abilities: String?
        
        let hiddenAbilities: String?
        
        var stats: Int?{
            let hp: Int?
            let attack: Int?
            
        }
        
    }
    
    
    
    func searchPockemon(keyword : String){
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        guard let req_url = URL(string: "https://github.com/kotofurumiya/pokemon_data/blob/master/data/pokemon_data.json") else {
            return
        }
        print(req_url)
    }
    
    
}

