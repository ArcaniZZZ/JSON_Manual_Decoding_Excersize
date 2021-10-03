//
//  TableViewController.swift
//  ParsingJSONExcersize
//
//  Created by Arcani on 03.10.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var listOfUsers: [User] = []
    let link = "https://randomuser.me/api/?results=15"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfUsers.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = listOfUsers[indexPath.row].name?.last ?? ""
        content.secondaryText = listOfUsers[indexPath.row].name?.first ?? ""
        cell.contentConfiguration = content
        return cell
    }
    
    private func downloadData() {
        NetworkManager.shared.fetchUsers(from: link) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    self.listOfUsers = users
                    self.tableView.reloadData()
                    print("SUCCESS")
                    
                case .failure:
                    print("NOPE NOPE NOPE")
                }
            }
        }
        
    }
}
