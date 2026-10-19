//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Christian Martinez on 9/12/26.
//  Copyright © 2026 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var bmiValue: String?//Optional String
    var advice: String?
    var color: UIColor?

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
        
    }
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
