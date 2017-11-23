//
//  ViewController.swift
//  FirstProject
//
//  Created by Danillo on 21/11/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var visor: UILabel!
    
    var userIsTyping = false
    var number: Double = 0
    var operador: String = ""
    
    var displayValue: Double {
        get {
            return Double(visor.text!)!
        }
        set {
            visor.text = String(newValue)
        }
    }
    
    @IBAction func touchOperation(_ sender: UIButton) {
        let operation = sender.currentTitle!
        switch operation {
        case "+":
            number = displayValue
            operador = operation
            userIsTyping = false
            break
        case "−":
            number = displayValue
            operador = operation
            userIsTyping = false
            break
        case "×":
            number = displayValue
            operador = operation
            userIsTyping = false
            break
        case "÷":
            number = displayValue
            operador = operation
            userIsTyping = false
            break
        case "±":
            let novoValor: Double = Double(visor.text!)! * -1
            visor.text = String(novoValor)
            break
        case "√":
            number = displayValue
            visor.text = String(sqrt(number))
            break
        case "%":
            number = displayValue
            number = (number * Double(visor.text!)!) / 100
            visor.text = String(number)
        default:
            break
        }
    }
    
    @IBAction func touchDot(_ sender: UIButton) {
        if userIsTyping {
            if !visor.text!.contains(",") {
                visor.text = visor.text! + ","
            }
        } else {
            visor.text = "0,"
            userIsTyping = true
        }
    }
    
    @IBAction func touchClean(_ sender: UIButton) {
            userIsTyping = false
            visor.text = "0"
        
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTyping {
            let textDisplay = visor.text ?? ""
            visor.text = textDisplay + digit
        } else {
            visor.text = digit
            userIsTyping = true
        }
        
    }
    
    @IBAction func touchResult(_ sender: UIButton) {
        switch operador {
        case "+":
            number = number + Double(visor.text!)!
            visor.text = String(number)
        case "−":
            number = number - Double(visor.text!)!
            visor.text = String(number)
        case "×":
            number = number * Double(visor.text!)!
            visor.text = String(number)
        case "÷":
            number = number / Double(visor.text!)!
            visor.text = String(number)
            break
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

