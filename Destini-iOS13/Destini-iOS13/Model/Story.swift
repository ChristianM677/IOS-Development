//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story { //This is the first and our main structure called Story which is used in our second structure "Story Brain"
    var title = String()
    var choice1 = String()
    var choice1Destination = Int()
    var choice2 = String()
    var choice2Destination = Int()
    
    init(title: String, choice1: String, c1D: Int, choice2: String, c2D: Int){
        self.title = title
        self.choice1 = choice1
        choice1Destination = c1D
        self.choice2 = choice2
        choice2Destination = c2D
        
    }
}

