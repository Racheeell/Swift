//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 07/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
import Foundation
struct Question {
    let text: String
//     Perguntas de múltipla escolha têm várias respostas, um Array of Strings funcionaria para nossos dados de teste.
    let answers: [String]
    //Olhe para os dados no array do quiz, há uma string separada que é a correctAnswer.
    var respostaCorreta: String
    
    init(q: String, a: [String], correctAnswer: String ){
        text = q
        answers = a
        respostaCorreta = correctAnswer
    }
}
