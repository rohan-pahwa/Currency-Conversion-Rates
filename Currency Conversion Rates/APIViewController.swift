//
//  APIViewController.swift
//  Currency Conversion Rates
//
//  Created by Rohan Pahwa on 8/5/20.
//  Copyright © 2020 Rohan. All rights reserved.
//

import UIKit

class APIViewController: UIViewController {
    @IBOutlet weak var APILabel: UILabel!
    var json = JSON()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(json.description)
        APILabel.text = String(json.description)
    }
    
}
