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
    var itemsArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK - Navigation bar Add item Button
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        var addItem = UITextField()
        let alert = UIAlertController(title: "Add new Item in List 🤓", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if addItem.text != "" {
                self.itemsArray.append(addItem.text!)
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
        cell.textLabel?.text = itemsArray[indexPath.row]
        return cell
    }
    
    
    //MARK - tableView Delegates
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }







}
