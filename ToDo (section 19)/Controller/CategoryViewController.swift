//
//  CategoryViewController.swift
//  ToDo (section 19)
//
//  Created by devansh.vyas on 15/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController : Delete{

    //MARK: variables
    var categoryArray : [Lists] = [Lists]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.rowHeight = 80
        searchBar.barTintColor = UIColor(hexString: "0096FF")
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.flatWhite]
    }
    
    //MARK: Add Category Button
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add new Category", message: "", preferredStyle: .alert)
        var textField = UITextField()
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {
            (cancel) in
            
        }
        let addAction = UIAlertAction(title: "Add", style: .default) {
            (action) in
            if textField.text?.count != 0 {
                let newObj = Lists(context: self.context)
                newObj.name = textField.text
                
                let hex = UIColor.randomFlat.hexValue()
                newObj.hexColor = hex
                
                self.categoryArray.append(newObj)
                self.saveData()
            }
        }
        
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        alert.addTextField {
           insertedText in
            insertedText.placeholder = "Add Category"
            textField = insertedText
        }
        
        present(alert,animated: true,completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ToDoViewController
        if let index = tableView.indexPathForSelectedRow{
            destination.selectedCategory = categoryArray[index.row]
        }
    }
    
    override func deleteObj(index: Int) {
        context.delete(categoryArray[index])
        categoryArray.remove(at: index)
        do{
            try context.save()
        }catch{
            print(error)
        }
        
    }
}
