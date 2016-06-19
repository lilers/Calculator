//
//  Formatter.swift
//  Tip Calculator
//
//  Created by Lily on 6/5/16.
//  Copyright © 2016 Lily Tran. All rights reserved.
//

import UIKit

class Formatter: NSNumberFormatter {

    let formatter = NSNumberFormatter()
    
    var formatCurrency: NSNumberFormatter {
        formatter.numberStyle = .CurrencyStyle
        return formatter
    }
    
    var formatNumber: NSNumberFormatter {
        formatter.numberStyle = .DecimalStyle
        return formatter
    }
    
    func formatTipAndTotal(tip: Double, total: Double) -> (String, String) {
        var tipString = formatNumber.stringFromNumber(tip)!
        tipString = formatCurrency.stringFromNumber(tip)!
        
        var totalString = formatNumber.stringFromNumber(total)!
        totalString = formatCurrency.stringFromNumber(total)!
        
        return (tipString, totalString)
    }
}
