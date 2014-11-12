//
//  ToppingTableViewController.swift
//  Top it!
//
//  Created by Gregory Ziegan on 11/11/14.
//  Copyright (c) 2014 Greg Ziegan. All rights reserved.
//

import UIKit
import Realm

class ToppingTableViewController: UIViewController, UITableViewDelegate {
    
    let realm = RLMRealm.defaultRealm()
    var toppings = Topping.allObjects()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(Topping.allObjectsInRealm(realm).count)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as ToppingTableViewCell
        
        // Configure the cell...
        let topping = toppings[UInt(indexPath.row)] as Topping
        cell.toppingName.text = topping.name
        return cell
    }
    
}