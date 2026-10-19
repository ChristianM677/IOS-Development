//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

//Our protocol that will send our price and currency type that we get here to the viewcontroller
protocol CoinManagerDelegate{
    func updateRate(price: String, currency: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    //Create a delegate that links to our protocol
    var delegate: CoinManagerDelegate?
    //Our url in 2 parts
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey = "?apikey=4ba4d7f4-5238-406e-90d6-7a60b6a10e2d"
    //List of currency types
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    //Function that fetches the currency chosen and also gets ahold of the price of it
    //The parameter "currency" is getting passed whatever the currency choice is 
    func getCoinPrice(for currency: String){
        
        let urlstring = "\(baseURL)\(currency)\(apiKey)"
        //Creates a url
        if let url = URL(string: urlstring){
            //Creates a session
            let session = URLSession(configuration: .default)
            //We create a task for the session where it fetches the data, response and any error
            let task = session.dataTask(with: url) { (data, response, error) in
                //If an error is presenst, it will be sent to the delegate and not proceed further
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                //If data is passed through, we create a var bitcoinPrice which is then calculated by our parseJSON
                if let safeData = data{
                    if let bitcoinPrice = self.parseJSON(safeData){
                        //The bitcoin price is now converted to a string and rounded 2 places
                        let priceString = String(format: "%.2f", bitcoinPrice)
                        
                        //Sends our total price with its currency type to delegate
                        self.delegate?.updateRate(price: priceString, currency: currency)
                    }
                }
            }
            task.resume()
        }
    }
    //Grabs the price/rate depending on the currency chosen
    func parseJSON(_ data: Data) -> Double?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            print(lastPrice)
            
            return lastPrice
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }

    
}

