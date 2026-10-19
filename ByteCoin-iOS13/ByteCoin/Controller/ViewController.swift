//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

//API KEY 4ba4d7f4-5238-406e-90d6-7a60b6a10e2d
import UIKit

class ViewController: UIViewController{
    
    
    //Passing our struct from the model folder to the controller using a constant declaration
    var coinManager = CoinManager()
    
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }
    
}
    
//MARK: - CoinManagerDelegate
extension ViewController: CoinManagerDelegate{
    func updateRate(price: String, currency: String) {
        DispatchQueue.main.async{
            self.bitcoinLabel.text = price
            self.currencyLabel.text = currency
                
        }
    }
        
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    //Determines how many columns we want in our pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Returns the count of currency options from our array and that count is the number of rows the func creates
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    //Determines the name of each of our rows as every option we have an our array
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (coinManager.currencyArray[row])
    }
    
    //Func that triggers when a row is clicked
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        //Whatever currency is clicked, that currency will get passed on to our getCoinPrice function
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}





