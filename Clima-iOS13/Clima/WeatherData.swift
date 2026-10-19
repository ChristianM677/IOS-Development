//
//  WeatherData.swift
//  Clima
//
//  Created by Christian Martinez on 9/21/26.
//  Copyright © 2026 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable{
    let name: String
    let main: Main
    let weather: [Weather]
}
struct Weather: Decodable{
    let description: String
    let id: Int
}

struct Main: Decodable{
    let temp: Double
}


