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
    var backgroundObserv: AnyObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tip Calculator"
        billField.becomeFirstResponder()
        let notifCenter = NSNotificationCenter.defaultCenter()
        let operationQue = NSOperationQueue.mainQueue()
        self.backgroundObserv = notifCenter.addObserverForName(UIApplicationDidBecomeActiveNotification, object: nil, queue: operationQue, usingBlock: { (notification: NSNotification!) -> Void in
            let startTime = self.defaults.objectForKey("timer") as? NSDate
            print(startTime)
            let elapsedTime = NSDate().getTimeDifference(startTime!)
            print(elapsedTime)
            if (elapsedTime < 1) {
                print("w")
                self.getSavedData()
            }
        })
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self.backgroundObserv!)
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
        defaults.setDouble(tip, forKey: "tip")
        defaults.setDouble(total, forKey: "total")
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
        billField.text = defaults.stringForKey("billAmount")
        tipField.text = defaults.stringForKey("tipAmount")
        
        let tip = defaults.doubleForKey("tip")
        let total = defaults.doubleForKey("total")
        
        tipLabel.text = formatter.formatTipAndTotal(tip, total: total).0
        totalLabel.text = formatter.formatTipAndTotal(tip, total: total).1
    }
}

