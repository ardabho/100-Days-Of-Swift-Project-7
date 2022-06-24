//
//  ViewController.swift
//  100 Days Of Swift-Project 7
//
//  Created by Arda Büyükhatipoğlu on 24.06.2022.
//

import UIKit

class ViewController: UITableViewController {

    var petitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlLink = "https://www.hackingwithswift.com/samples/petitions-1.json"
        
        if let url = URL(string: urlLink){
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
        
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let decodedData = try? decoder.decode(Petitions.self, from: json) {
            petitions = decodedData.results
            tableView.reloadData()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        cell.textLabel?.text = petitions[indexPath.row].title
        cell.detailTextLabel?.text = petitions[indexPath.row].body
        return cell
    }
    
}

