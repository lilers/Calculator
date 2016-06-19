//
//  SplitBillViewController.swift
//  Tip Calculator
//
//  Created by Lily on 6/5/16.
//  Copyright © 2016 Lily Tran. All rights reserved.
//

import UIKit

class SplitBillViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipField: UITextField!
    @IBOutlet weak var peopleField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var dividedTipLabel: UILabel!
    @IBOutlet weak var dividedTotalLabel: UILabel!
    
    var formatter = Formatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateTipAndTotal() {
        let billAmount = NSString(string: billField.text!).doubleValue
        let tipAmount = NSString(string: tipField.text!).doubleValue * 0.01
        let people = NSString(string: peopleField.text!).doubleValue
        let tip = billAmount * tipAmount
        let total = billAmount + tip
        
        var dividedTip = tip/people
        var dividedTotal = total/people
        
        if (people == 0) {
            dividedTip = tip
            dividedTotal = total
        }
        
        tipLabel.text = String(format: "%.2f", tip)
        tipLabel.text = formatter.formatTipAndTotal(tip, total: total).0
        
        totalLabel.text = String(format: "%.2f", total)
        totalLabel.text = formatter.formatTipAndTotal(tip, total: total).1
        
        dividedTipLabel.text = String(format: "%.2f", dividedTip)
        dividedTipLabel.text = formatter.formatTipAndTotal(dividedTip, total: dividedTotal).0
        
        dividedTotalLabel.text = String(format: "%.2f", dividedTotal)
        dividedTotalLabel.text = formatter.formatTipAndTotal(dividedTip, total: dividedTotal).1
    }

    @IBAction func billAmountEntered(sender: AnyObject) {
        calculateTipAndTotal()
    }
    
    @IBAction func tipEntered(sender: AnyObject) {
        calculateTipAndTotal()
    }
    
    @IBAction func peopleEntered(sender: AnyObject) {
        calculateTipAndTotal()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
