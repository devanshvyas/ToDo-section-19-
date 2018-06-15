//
//  TableView.swift
//  ToDo (section 19)
//
//  Created by devansh.vyas on 15/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

extension ToDoViewController{
    //MARK: - tableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "toDoCell")
        cell.accessoryType = itemsArray[indexPath.row].check ? .checkmark : .none
        cell.textLabel?.text = itemsArray[indexPath.row].title
        return cell
    }
    
    
    //MARK: - tableView Delegates
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemsArray[indexPath.row].check = !itemsArray[indexPath.row].check
        saveData()
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension CategoryViewController {
    //MARK: tableView Datasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "categoryCell")
        cell.textLabel?.text = categoryArray[indexPath.row].name
        return cell
    }
}
