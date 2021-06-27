    //
    //  ViewController.swift
    //  Auto Layout Calculator
    //
    //  Created by Swanand Deshpande on 25/05/21.
    //

    import UIKit

    /**
     
     Tags used for buttons:
     For 0 to 9 Numbers: 1 to 10
     Clear Button: 11
     Division (/): 12
     Multiplication: 13
     Subtraction: 14
     Addition: 15
     Equal: 16
     
     */

    class ViewController: UIViewController {
        
        @IBOutlet weak var numberLabel: UILabel!
        
        var currentNumber: Double = 0
        var previousNumber: Double = 0
        var performingMath: Bool = false
        var operation = 0
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
        
        @IBAction func numberPressed(_ sender: UIButton) {
            if performingMath {
                numberLabel.text = String(sender.tag - 1)
                currentNumber = Double(numberLabel.text!)!
                performingMath = false
            } else {
                numberLabel.text = numberLabel.text! + String(sender.tag - 1)
                currentNumber = Double(numberLabel.text!)!
            }
        }
        
        
        @IBAction func operatorPressed(_ sender: UIButton) {
            
            if numberLabel.text != "" && sender.tag != 11 && sender.tag != 16 {
                
                previousNumber = Double(numberLabel.text!)!
                
                if sender.tag == 12 {
                    numberLabel.text = "/"
                }
                
                if sender.tag == 13 {
                    numberLabel.text = "x"
                }
                
                if sender.tag == 14 {
                    numberLabel.text = "-"
                }
                
                if sender.tag == 15 {
                    numberLabel.text = "+"
                }
                
                operation = sender.tag
                performingMath = true
                
            } else if sender.tag == 16 {
                
                if operation == 12 {
                    numberLabel.text = String(previousNumber / currentNumber)
                } else if operation == 13 {
                    numberLabel.text = String(previousNumber * currentNumber)
                } else if operation == 14 {
                    numberLabel.text = String(previousNumber - currentNumber)
                } else if operation == 15 {
                    numberLabel.text = String(previousNumber + currentNumber)
                }
                
            } else if sender.tag == 11 {
                numberLabel.text = ""
                previousNumber = 0
                currentNumber = 0
                operation = 0
            }
        }
        
    }

