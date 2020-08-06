//
//  FinalViewController.swift
//  Currency Conversion Rates
//
//  Created by Rohan Pahwa on 8/6/20.
//  Copyright © 2020 Rohan. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    var foreignCurrencyName = ""
    var foreignCurrencyUSDValue = ""
    @IBOutlet weak var currencyNameLabel: UILabel!
    @IBOutlet weak var enteredAmount: UITextField!
    @IBOutlet weak var returnAmount: UITextField!
    @IBOutlet weak var secondCurrencyNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(foreignCurrencyUSDValue)
        print(foreignCurrencyName)
        currencyNameLabel.text = foreignCurrencyName
    }
    
    @IBAction func onSwitchButtonClicked(_ sender: Any) {
        if currencyNameLabel.text == "USD($)"{
            currencyNameLabel.text = foreignCurrencyName
            secondCurrencyNameLabel.text = "USD($)"
        }
        else{
        currencyNameLabel.text = "USD($)"
        secondCurrencyNameLabel.text = foreignCurrencyName
        }
    }
    
    @IBAction func onCalculateButtonClicked(_ sender: Any) {
        let foreign = Double(foreignCurrencyUSDValue)
        if currencyNameLabel.text == "USD($)"{
            if enteredAmount.text != "" && enteredAmount.text != " "{
                if let entered = Double(enteredAmount.text!){
                    var final = entered * foreign!
                    final = Double(round(100*final)/100)
                    returnAmount.text = String(final)
                }
            }
        }
        else{
            if enteredAmount.text != "" && enteredAmount.text != " "{
                if let entered = Double(enteredAmount.text!){
                    var final = entered/foreign!
                    final = Double(round(100*final)/100)
                    returnAmount.text = String(final)
                }
            }
        }
    }
    
}
