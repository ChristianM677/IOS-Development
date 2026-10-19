//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let heightValue = (String(format: "%.2fm", sender.value))//Rounds our numbers to nearest hundreth and keeps(m)
        heightLabel.text = heightValue//displays in text screen
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weightValue = (String(format: "%.0fKg", sender.value))
        weightLabel.text = weightValue
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)//The main view controler(self) is performing a segue which connects to our other view controller and that segure is "goToResult"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){//Over
        if segue.identifier == "goToResult"{//The name of our segue basically
            let destinationVC = segue.destination as! ResultViewController //We narrow down our data type and specify exact data type using (as!
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

