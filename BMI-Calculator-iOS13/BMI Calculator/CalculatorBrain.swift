//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Christian Martinez on 9/13/26.
//  Copyright © 2026 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain{
    
    var bmi: BMI? //Will send an optional float
    
    func getBMIValue() -> String{
        let bmi1 = String(format: "%.1f", bmi?.value ?? 0.0) //Depending if bmi is nil or not(bmi?) we get access to the value. If bmi is nil, it will print 0.0
        return bmi1
    }
    func getAdvice() -> String{
        return bmi?.advice ?? "No advice"
    }
    func getColor() -> UIColor{
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / (height * height)
        
        func bmiResult(){
            if bmiValue < 18.5{
                bmi = BMI(value: bmiValue, advice: "Eat more bro", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
            } else if bmiValue < 24.9{
                bmi = BMI(value: bmiValue, advice: "Keep that diet", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
            } else{
                bmi = BMI(value: bmiValue, advice: "Dont eat more", color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
            }
        }
    }
}
