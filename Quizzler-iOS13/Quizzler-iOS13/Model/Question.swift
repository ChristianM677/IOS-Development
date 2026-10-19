//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Christian Martinez on 9/8/26.
//  Copyright © 2026 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String

    init(q: String, a: String) {
        text = q
        answer = a
    }
}
