//
//  SearchBar.swift
//  ToDo (section 19)
//
//  Created by devansh.vyas on 15/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import CoreData

//MARK: ToDo
extension ToDoViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        textChanged(searchText: searchBar.text!)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0{
            loadData()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }else{
            textChanged(searchText: searchBar.text!)
        }
        
    }
    
    func textChanged(searchText : String){
        let req : NSFetchRequest<Items> = Items.fetchRequest()
        
        let pre = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        req.predicate = pre
        
        let sortD = NSSortDescriptor(key: "title", ascending: true)
        req.sortDescriptors = [sortD]
        
        loadData(request: req,predicate: pre)
        tableView.reloadData()
    }
    
}

//MARK: Category
extension CategoryViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        textChanged(searchText: searchBar.text!)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadData()
        }
        else{
            textChanged(searchText: searchBar.text!)
       }
    }
    
    func textChanged(searchText: String){
        let req : NSFetchRequest<Lists> = Lists.fetchRequest()
        
        let pre = NSPredicate(format: "name CONTAINS[cd] %@", searchText)
        req.predicate = pre
        
        let sort = NSSortDescriptor(key: "name", ascending: true)
        req.sortDescriptors = [sort]
        
        loadData(request: req)
        tableView.reloadData()
    }
}
