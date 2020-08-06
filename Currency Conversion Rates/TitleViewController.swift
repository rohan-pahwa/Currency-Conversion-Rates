//
//  TitleViewController.swift
//  Currency Conversion Rates
//
//  Created by Rohan Pahwa on 8/5/20.
//  Copyright © 2020 Rohan. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {
    @IBOutlet weak var updateInfo1: UILabel!
    @IBOutlet weak var updateInfo2: UILabel!
    let apiKey = "6a3262a74cfa77c0d7508de5"
    var json = JSON()
    override func viewDidLoad() {
        super.viewDidLoad()
        let query = "https://v6.exchangerate-api.com/v6/\(apiKey)/latest/USD"
        self.title = "Current Conversion Rates"
        if let url = URL(string: query) {
            if let data = try? Data(contentsOf: url) {
                let jsn = try! JSON(data: data)
                json = jsn
                updateInfo1.text = "Last Update - \(json["time_last_update_utc"])"
                updateInfo2.text = "Next Update - \(json["time_next_update_utc"])"
                return
                
            }
        }
        loadError()

    }
    
    func loadError() {
        let alert = UIAlertController(title: "Loading Error",
                                      message: "There was a problem reaching current currency conversion rates",
                                      preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dvc = segue.destination as? CurrenciesViewController{
            dvc.json = self.json
        }
        if let dvc = segue.destination as? APIViewController{
            dvc.json = self.json
        }
        
    }
    
    
    
}
