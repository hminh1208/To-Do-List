//
//  FirstViewController.swift
//  To Do List
//
//  Created by minh phan on 11/10/14.
//  Copyright (c) 2014 minh phan. All rights reserved.
//

import UIKit

var toDoItems:[String] = []

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var taskTable:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return toDoItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        cell.textLabel.text = toDoItems[indexPath.row]
        
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        if var storedItems : AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("toDoItems") {
            
            toDoItems = []
            
            for var i = 0; i < storedItems.count; i++ {
                toDoItems.append(storedItems[i] as NSString)
                }
        }
        
        
        
        taskTable.reloadData()
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            toDoItems.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(toDoItems, forKey: "toDoItems")
            
            NSUserDefaults.standardUserDefaults().synchronize()
            
            taskTable.reloadData()
        }
    }
}

