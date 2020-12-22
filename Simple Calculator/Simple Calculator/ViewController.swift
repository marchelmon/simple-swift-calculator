//
//  ViewController.swift
//  Simple Calculator
//
//  Created by marchelmon on 2020-12-21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var firstValue: Int = 0
    var secondValue: Int = 0
    var calculation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        if let action = sender.currentTitle {
            if action == "=" {
                if firstValue != 0 {
                    calculateResult()
                }
            } else if action == "AC" {
                setValues(result: 0)
            } else {
                if firstValue != 0 {
                    calculation = action
                    resultLabel.text = calculation
                }
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if Int(resultLabel.text!) == nil {
            resultLabel.text = ""
        }
        let displayValue = resultLabel.text
        
        if let newNumber = sender.currentTitle {
            
            if resultLabel.text == "0" {
                resultLabel.text = newNumber
                if firstValue == 0 {
                    firstValue = Int(newNumber)!
                }
            } else {
                let newDisplayValue = "\(displayValue! + newNumber)"
                resultLabel.text = newDisplayValue
                if calculation == "" {
                    firstValue = Int(newDisplayValue)!
                } else {
                    secondValue = Int(newDisplayValue)!
                }
            }
        }
    }
    
    func calculateResult() {
        
        if secondValue == 0 || calculation == "AC" {
            setValues(result: 0)
        }
        
        switch calculation {
        case "AC":
            setValues(result: 0)
        case "/":
            let result = firstValue / secondValue
            setValues(result: result)
        case "x":
            let result = firstValue * secondValue
            setValues(result: result)
        case "-":
            let result = firstValue - secondValue
            setValues(result: result)
        case "+":
            let result = firstValue + secondValue
            setValues(result: result)
        default:
            print("No calculation, error or ignored")
        }
    }
    
    func setValues(result: Int) {
        print("RESULT: \(result)")
        resultLabel.text = "\(result)"
        firstValue = result
        secondValue = 0
    }
    
}

