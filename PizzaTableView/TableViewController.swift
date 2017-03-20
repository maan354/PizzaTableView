//
//  TableViewController.swift
//  PizzaTableView
//
//  Created by MAHHA on 20/03/2017.
//  Copyright © 2017 MAHHA. All rights reserved.
//

import UIKit

protocol TableViewControllerDelegate{
    
    func didSelectItem(name:String, price:Double)
    
}

class TableViewController: UITableViewController { // Delegator  Class, in this case we use delegation pattern to communicate behavior
    
    var delegate:TableViewControllerDelegate! = nil // we should declare delegate property
    
    var menuItems = MenuItems()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let name = menuItems.names[row]
        let price = menuItems.prices[row]
        delegate.didSelectItem(name: name , price: price)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems.names.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            let row = indexPath.row
            cell.textLabel?.text = menuItems.names[row]
            
            let price = String(format: "%2.2f", menuItems.prices[row])
            cell.detailTextLabel?.text = price
        
        
        if menuItems.specials[row] {
            cell.backgroundColor = UIColor.orange
        }
        else{
            cell.backgroundColor = UIColor.white
        }
            
            return cell
        
    }
    
    

}
