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
        
        let name: String?
        
    }
    
    struct ResultJson: Codable {
        let item:[ItemJson]?
    }
    
    
    
    func searchPockemon(keyword : String){
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        guard let req_url = URL(string: "https://usumapi.nelke.jp/v1/pokemon/?no={%1}&?key={%2}") else {
            return
        }
        print(req_url)
        
        let req = URLRequest(url: req_url)
        let session = URLSession(configuration: .default, delegate: nil,delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: req, completionHandler: {
            (data ,response , error) in
            
            session.finishTasksAndInvalidate()
            
            do {
                
                let decoder = JSONDecoder()
                
                let json = try decoder.decode(ResultJson.self, from: data!)
                
                print(json)
                
            } catch {
                print("エラーだよ")
            }
        })
        
        task.resume()
        
    }
    
}


