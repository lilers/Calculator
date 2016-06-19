//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Lily on 6/5/16.
//  Copyright © 2016 Lily Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    let formatter = Formatter()
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tip Calculator"
        getSavedData()
        //billField.becomeFirstResponder()
        //print(NSDate().minute())
        /*let firstLaunch = defaults.boolForKey("firstLaunch")
        if (firstLaunch == true) {
            print("not")
            defaults.setObject(NSDate(), forKey: "start")
            defaults.setBool(false, forKey: "firstLaunch")
        } else {
            print("launch")
            let time = NSDate().getTimeDifference(defaults.objectForKey("start") as! NSDate)
            print(time)
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateTipAndTotal() {
        let billAmount = NSString(string: billField.text!).doubleValue
        let tipAmount = NSString(string: tipField.text!).doubleValue
        let tip = billAmount * tipAmount * 0.01
        let total = billAmount + tip
        
        tipLabel.text = String(format: "%.2f", tip)
        tipLabel.text = formatter.formatTipAndTotal(tip, total: total).0
        
        totalLabel.text = String(format: "%.2f", total)
        totalLabel.text = formatter.formatTipAndTotal(tip, total: total).1
        
        defaults.setObject(billAmount, forKey: "billAmount")
        defaults.setObject(tipAmount, forKey: "tipAmount")
        defaults.setDouble(0.00, forKey: "tip")
        defaults.setDouble(0.00, forKey: "total")
        //print(defaults.stringForKey("billAmount"))
        print(defaults.objectForKey("billAmount")!)
        print(defaults.doubleForKey("tip"))
        print(defaults.doubleForKey("total"))
    }
    
    @IBAction func billAmountEntered(sender: AnyObject) {
        calculateTipAndTotal()
    }
    
    @IBAction func tipEntered(sender: AnyObject) {
        calculateTipAndTotal()
    }
    
    @IBAction func tapOutside(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func getSavedData() {
        /*if let billAmount = defaults.stringForKey("billAmount") {
            billField.text = billAmount
        } else {
            billField.text = ""
        }*/
        //print(billField.text)
        //tipField.text = defaults.stringForKey("tipAmount")
        
        let tip = defaults.doubleForKey("tip")
        let total = defaults.doubleForKey("total")
        tipLabel.text = tip as? String
        //tipLabel.text = formatter.formatTipAndTotal(tip, total: total).0
        //totalLabel.text = formatter.formatTipAndTotal(tip, total: total).1
    }
}

