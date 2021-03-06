//
//  ViewController.swift
//  Calculator
//
//  Created by Rafagan Abreu on 13/11/17.
//  Copyright © 2017 CINQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    var userIsTyping: Bool = false
    var isNumberZero: Bool = false
    var manager = CalculatorManager()
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func touchClear(_ sender: UIButton) {
        userIsTyping = false
        display.text = "0"
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTyping {
            let textDisplay = display.text ?? ""
            if (textDisplay == "0" && digit == "0") {
               display.text = digit
            } else {
                display.text = textDisplay + digit
            }
        } else {
            if (digit != "0") {
                display.text = digit
                userIsTyping = true
            }
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsTyping {
            userIsTyping = false
            manager.setOperand(displayValue)
        }
        
        if let mathSymbol = sender.currentTitle {
            manager.perfomOperation(mathSymbol)
        }
        
        displayValue = manager.result
        
    }
}
