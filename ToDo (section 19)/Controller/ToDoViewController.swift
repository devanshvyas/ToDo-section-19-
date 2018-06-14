//
//  ViewController.swift
//  ToDo (section 19)
//
//  Created by devansh.vyas on 14/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    //MARK- variables:-
    var itemsArray = [ItemsData]()
//    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //        if let items = defaults.array(forKey: "addedItems") as? [String]{
//            itemsArray = items
//        }
    }

    //MARK - Navigation bar Add item Button
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        var addItem = UITextField()
        let alert = UIAlertController(title: "Add new Item in List 🤓", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if addItem.text != "" {
                var item = ItemsData()
                item.items = addItem.text!
                self.itemsArray.append(item)
               //self.defaults.set(self.itemsArray, forKey: "addedItems")
                self.tableView.reloadData()
            }
        }
        
        alert.addTextField { (insertedText) in
            insertedText.placeholder = "What you want to be remembered?!"
            addItem = insertedText
        }
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    

}

extension ToDoViewController{
    //MARK - tableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "toDoCell")
        cell.textLabel?.text = itemsArray[indexPath.row].items
        cell.accessoryType = itemsArray[indexPath.row].check ? .checkmark : .none
        return cell
    }
    
    
    //MARK - tableView Delegates
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemsArray[indexPath.row].check = !itemsArray[indexPath.row].check
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }







}
