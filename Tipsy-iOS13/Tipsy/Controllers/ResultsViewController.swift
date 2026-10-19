//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Christian Martinez on 9/13/26.
//  Copyright © 2026 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    var calculation = ""
    var numberPeople = 0
    var tip = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = calculation
        settingLabel.text = "Split between \(numberPeople), with \(tip) tip."
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
