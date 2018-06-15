//
//  SearchBar.swift
//  ToDo (section 19)
//
//  Created by devansh.vyas on 15/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import CoreData


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
        let request : NSFetchRequest<Items> = Items.fetchRequest()
        
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        request.predicate = predicate
        
        let sortDescriptors = NSSortDescriptor(key: "title", ascending: true)
        request.sortDescriptors = [sortDescriptors]
        
        loadData(request: request)
        tableView.reloadData()
    }
    
}
