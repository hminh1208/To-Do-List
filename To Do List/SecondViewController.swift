//
//  SecondViewController.swift
//  To Do List
//
//  Created by minh phan on 11/10/14.
//  Copyright (c) 2014 minh phan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var toDoItem: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        toDoItems.append(toDoItem.text)
        
        NSUserDefaults.standardUserDefaults().setObject(toDoItems, forKey: "toDoItems")
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        toDoItem.resignFirstResponder()
        return true
    }
}

