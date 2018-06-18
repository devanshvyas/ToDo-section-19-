//
//  TableView.swift
//  ToDo (section 19)
//
//  Created by devansh.vyas on 15/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import ChameleonFramework


//MARK: ToDo
extension ToDoViewController{
    //MARK: - tableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .default, reuseIdentifier: "toDoCell")
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.accessoryType = itemsArray[indexPath.row]!.check ? .checkmark : .none
        cell.textLabel?.text = itemsArray[indexPath.row]!.title
        cell.backgroundColor = UIColor(hexString: (selectedCategory?.hexColor)!)?.darken(byPercentage: CGFloat(indexPath.row)/CGFloat(itemsArray.count))
        cell.textLabel?.textColor = ContrastColorOf(cell.backgroundColor!, returnFlat: true)
        return cell
    }
    
    
    //MARK: - tableView Delegates
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemsArray[indexPath.row]!.check = !itemsArray[indexPath.row]!.check
        saveData()
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


//MARK: Category
extension CategoryViewController  {
    //MARK: tableView Datasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.backgroundColor = UIColor.init(hexString: categoryArray[indexPath.row].hexColor!)
        cell.textLabel?.text = categoryArray[indexPath.row].name
        cell.textLabel?.textColor = ContrastColorOf(cell.backgroundColor!, returnFlat: true)
        return cell
    }
    
    //MARK: tableview Delegates
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toToDoList", sender: self)
    }
    
}
