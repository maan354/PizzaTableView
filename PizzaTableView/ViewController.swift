//
//  ViewController.swift
//  PizzaTableView
//
//  Created by MAHHA on 20/03/2017.
//  Copyright © 2017 MAHHA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TableViewControllerDelegate { // Delegate Class
    
    @IBOutlet weak var pizzaName: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    func didSelectItem(name: String, price: Double) {
        pizzaName.text = name
        priceLabel.text = String(format:"TOTAL : %02.2f€",price)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Table"{
        
            let vc = segue.destination as! TableViewController
            vc.delegate = self
        
        }
    }

}
