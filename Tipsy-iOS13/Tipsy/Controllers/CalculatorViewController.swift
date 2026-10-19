//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.0
    var splitNumber = 0
    var total = 0.0
    var twoDecimalBill = ""
    var doubleBill = 0.0
    var caluclation = 0.0
    var calculationTwo = ""
    var percent = ""
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        //Select tips
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        //Grab tip labels text and convert into numbers and print it
        let buttonInt = sender.currentTitle!
        let numberNoPercentage = String(buttonInt.dropLast())
        let buttonTitleasNumber = Double(numberNoPercentage) ?? 0.0
        tip = buttonTitleasNumber / 100
        //Converting back to percentage for reference
        var percentageCalc = tip * 100
        var percentInt = Int(percentageCalc)
        percent = "\(percentInt)%"
           
        billTextField.endEditing(true)
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper){
        splitNumberLabel.text = String(format: "%.0f", sender.value)//Label text is going to be sender.value as a whole number
        splitNumber = Int(sender.value)//Convert to integer
    }
    
    //Returns the bill total user input
    func billTotal() -> Double{
        total = Double(billTextField.text!)!
        return total
    }
        
    @IBAction func calculatePressed(_ sender: UIButton) {
        //print(tip)
        //print(splitNumber)
        //print(doubleBill)
        twoDecimalBill = String(format: "%.2f", billTotal())
        doubleBill = Double(twoDecimalBill)!
        caluclation = ((doubleBill + (doubleBill * tip)) / Double(splitNumber))
        calculationTwo = String(format: "%.2f", caluclation)
        print(calculationTwo)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goToResult"{//Fetching the segue
            let resultVC = segue.destination as! ResultsViewController //Changing to ResultView
            resultVC.calculation = calculationTwo
            resultVC.numberPeople = splitNumber
            resultVC.tip = percent
        }
    }
        
    
    
}
