//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Rachel Arruda Lima on 04/07/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
struct Question {
    let text: String
    let answer: String
    
    init(q: String, r: String){
        text = q
        answer = r
    }
}
