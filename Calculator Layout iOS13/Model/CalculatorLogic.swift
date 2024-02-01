//
//  CalculatorLogic.swift
//  Calculator Layout iOS13
//
//  Created by Gaurav Patil on 1/30/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    var number: Double?
    var intermediateCalculation: (n1: Double, calcMethod: String)?
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(with expr: String) -> Double? {
       
        if let num = number {
            if expr == "+/-" {
                return num * -1
            } else if expr == "AC" {
                return 0
            } else if expr == "%" {
                return num / 100
            } else if expr == "="{
                
                var result = perforMCal(n2: num)
                intermediateCalculation = nil
                return result
            } else {
                if let safeInter = intermediateCalculation {
                    var result = perforMCal(n2: num)
                    intermediateCalculation = (n1: result!, calcMethod: expr)
                } else {
                    intermediateCalculation = (n1: num, calcMethod: expr)
                }
                
            }
        }
        return nil
    }
    
    private func perforMCal(n2: Double) -> Double? {
        
        if let safeInterN1 = intermediateCalculation?.n1, let safeInterCal = intermediateCalculation?.calcMethod {
            switch safeInterCal {
            case "+" :
                return safeInterN1 + n2
                
            case "-" :
                return safeInterN1 - n2
                
            case "×" :
                return safeInterN1 * n2
               
            case "÷" :
                return safeInterN1 / n2
                
            default:
                fatalError("The op doesn't match")
            }
        }
        
        return nil
    }
}
