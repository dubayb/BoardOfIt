//
//  SearchAndAddGameViewController.swift
//  GameTrader
//
//  Created by bryan dubay on 6/15/22.
//  Copyright © 2022 Bryan Dubay. All rights reserved.
//

import UIKit

class SearchAndAddGameViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    var searchResults: BoardGameAtlasModel? {
        didSet {
            DispatchQueue.main.async { [self] in
                self.tableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        print("search and add VC")
    }
    

}

extension SearchAndAddGameViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let router = BoardGameAtlasRouter.searchGame(query: textField.text!)
        let bgSearch = bgatlasSearch.init(query: textField.text!)
        bgSearch.performRequest(route: router) { result in
            switch result {
            case .success(let model) :
                if let bgModel = model as? BoardGameAtlasModel {
                    self.searchResults = bgModel
                }
                
            case .failure(let error) :
                print(error)
             }
        }
        return true
    }
    
}
extension SearchAndAddGameViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //pop up view to add to your board game DB
        
        
    }
}
extension SearchAndAddGameViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let results = searchResults, let games = results.games {
            return games.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basic", for: indexPath) as UITableViewCell
        cell.textLabel!.text = searchResults?.games?[indexPath.row].name
        return cell
        
    }
    
    
    
    
}
struct bgatlasSearch : APIClient {
    var route: Router
    typealias T = BoardGameAtlasModel
    init(query: String) {
        route = BoardGameAtlasRouter.searchGame(query: query)
    }
}
