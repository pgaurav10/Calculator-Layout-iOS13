//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    private var currNum: String = ""
    
    private var displayValue: Double {
        get {
            guard let num = Double(displayLabel.text!) else {
                fatalError("Cannot convert text to double")
            }
            
            return num
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private var cal = CalculatorLogic()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        
        cal.setNumber(displayValue)
        if let expr = sender.currentTitle {
            
            
            if let result = cal.calculate(with: expr)  {
                displayValue = result
            }
            
        }
        
        currNum = ""
        
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if numValue == "." {
                
                let isInt = floor(displayValue) == Double(displayValue)
                
                if !isInt {
                    return
                }
                
                if currNum == "" {
                    currNum.append("0")
                }
            }
            
            currNum.append(numValue)
            displayLabel.text = currNum
        }
    }
    
}

