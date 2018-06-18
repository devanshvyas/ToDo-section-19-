//
//  ViewController.swift
//  ToDo (section 19)
//
//  Created by devansh.vyas on 14/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import CoreData
import SwipeCellKit
import ChameleonFramework

class ToDoViewController: Delete{
    //MARK: variables
    var itemsArray : [Items?] = [Items]()
    var selectedCategory : Lists? {
        didSet{
            loadData()
        }
    }
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        let file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        print(file ?? "nil")
        tableView.rowHeight = 70
        
    }

    override func viewWillAppear(_ animated: Bool) {
        let clr = UIColor(hexString: (selectedCategory?.hexColor)!)
        color(colour: clr)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        color(colour: UIColor(hexString: "0096FF"))
    }
    
    func color(colour : UIColor?) {
        if let uicolor = colour{
            navigationController?.navigationBar.barTintColor = uicolor
            navigationController?.navigationBar.tintColor = ContrastColorOf(uicolor, returnFlat: true)
            title = selectedCategory?.name
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : ContrastColorOf(uicolor, returnFlat: true)]
            searchBar.barTintColor = uicolor
        }
    }
    
    //MARK: - Navigation bar Add item Button
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        var addItem = UITextField()
        let alert = UIAlertController(title: "Add new Item in List 🤓", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) {
            (action) in
            if addItem.text != "" {
                let newItem = Items(context: self.context)
            
                newItem.check = false
                newItem.title = addItem.text!
                newItem.itemName = self.selectedCategory
                
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
    
    
    override func deleteObj(index: Int) {
        if let item = itemsArray[index]{
            itemsArray.remove(at: index)
            context.delete(item)
            do{
             try context.save()
            }catch{
                print(error)
            }
        }
    }
    
}




