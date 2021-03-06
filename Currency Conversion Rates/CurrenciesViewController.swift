//
//  ViewController.swift
//  Currency Conversion Rates
//
//  Created by Rohan Pahwa on 7/30/20.
//  Copyright © 2020 Rohan. All rights reserved.
//

import UIKit

class CurrenciesViewController: UITableViewController {
    let apiKey = "aea1871b1a715caf23bb2be2"
    var currencies = [[String: String]]()
    var names = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let query = "https://v6.exchangerate-api.com/v6/\(apiKey)/latest/USD"
        self.title = "Current Conversion Rates"
        if let url = URL(string: query) {
            if let data = try? Data(contentsOf: url) {
                let json = try! JSON(data: data)
                parse(json: json)
                return
                
            }
        }
        loadError()
    }
    
    func parse(json: JSON) {
        for result in json["conversion_rates"] {
            let name = result.0
            let rate = result.1
            var rat = rate.doubleValue
            rat = Double(round(1000*rat)/1000)
            let currency = ["name": name, "rate": String(rat)] as [String : String]
            currencies.append(currency)
            names.append(name)
            names = names.sorted()
        }
        
        tableView.reloadData()
    }
    
    func loadError() {
        let alert = UIAlertController(title: "Loading Error",
                                      message: "There was a problem reaching current currency conversion rates",
                                      preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let name = names[indexPath.row]
        for currency in currencies{
            if currency["name"] == name {
                cell.textLabel?.text = name
                cell.detailTextLabel?.text = ("$\(currency["rate"] ?? "Not Found")")
                
            }
        }
        return cell
    }
    
}
