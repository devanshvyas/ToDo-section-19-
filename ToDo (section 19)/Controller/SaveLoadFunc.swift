//
//  SaveLoadFunc.swift
//  ToDo (section 19)
//
//  Created by devansh.vyas on 15/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import CoreData

//MARK: ToDo
extension ToDoViewController{

    func saveData() {
        do{
            try context.save()
        }
        catch{
            print("error while saving data \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadData(request : NSFetchRequest<Items> = Items.fetchRequest() , predicate: NSPredicate? = nil) {
        let CategoryPredicate = NSPredicate(format: "itemName.name MATCHES %@", selectedCategory!.name!)
        if let newPre = predicate{
            let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [CategoryPredicate,newPre])
            request.predicate = compoundPredicate
        }
        else{
            request.predicate = CategoryPredicate
        }
        do{
            itemsArray = try context.fetch(request)
        }catch{
            print("error while loading: \(error)")
        }
    }
    
}

//MARK: Category
extension CategoryViewController{
    func saveData() {
        do{
            try context.save()
        }
        catch{
            print("error while saving data: \(error)")
        }
        tableView.reloadData()
    }
    
    func loadData(request : NSFetchRequest<Lists> = Lists.fetchRequest()) {
        do{
            categoryArray = try context.fetch(request)
        }catch{
            print("error while loading:\(error)")
        }
    }
    
}
