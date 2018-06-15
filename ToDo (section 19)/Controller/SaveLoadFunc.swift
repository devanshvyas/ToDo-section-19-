//
//  SaveLoadFunc.swift
//  ToDo (section 19)
//
//  Created by devansh.vyas on 15/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import CoreData

extension ToDoViewController{

    func saveData() {
        do{
            try context.save()
        }
        catch{
            print("here comes the error: \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadData(request : NSFetchRequest<Items> = Items.fetchRequest()) {
        do{
            itemsArray = try context.fetch(request)
        }catch{
            print(error)
        }
    }
    
}
