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
    var tempArray = ["hello","hey"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

extension ToDoViewController{
    //MARK - tableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "toDoCell")
        cell.textLabel?.text = tempArray[indexPath.row]
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
