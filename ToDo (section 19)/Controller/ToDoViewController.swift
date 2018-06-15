//
//  ViewController.swift
//  ToDo (section 19)
//
//  Created by devansh.vyas on 14/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import CoreData

class ToDoViewController: UITableViewController {
    //MARK- variables:-
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var itemsArray = [Items]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        print(file)
        loadData()
    }

    //MARK - Navigation bar Add item Button
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        var addItem = UITextField()
        let alert = UIAlertController(title: "Add new Item in List 🤓", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) {
            (action) in
            if addItem.text != "" {
                let newItem = Items(context: self.context)
            
                newItem.check = false
                newItem.title = addItem.text!
                self.itemsArray.append(newItem)
                self.saveData()
                
            }
        }
        
        alert.addTextField {
            (insertedText) in
            insertedText.placeholder = "What you want to be remembered?!"
            addItem = insertedText
        }
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
}




