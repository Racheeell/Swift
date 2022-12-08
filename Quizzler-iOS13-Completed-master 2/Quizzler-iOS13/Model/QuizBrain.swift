//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain{
    //matriz de questionarios
    let quiz =
    [
        Question(q: "Qual é o maior órgão do corpo humano?",
                 a: ["Coracao", "Pele", "Intestino grosso"],
                 correctAnswer: "Pele"),
        
       Question(q: "Cinco dólares valem quantos centavos?",
                a: ["25", "50", "100"],
                correctAnswer: "100"),
    
       Question(q: "O que significam as letras no fuso horário GMT?",
                a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"],
                correctAnswer: "Greenwich Mean Time"),
    
       Question(q: "Qual é a palavra francesa para 'chapéu'?",
                a: ["Chapeau", "Écharpe", "Bonnet"],
                correctAnswer: "Chapeau"),
    
       Question(q: "Em tempos passados, o que um cavalheiro guardava em seu bolso?",
                a: ["Caderno", "Lenço", "Watch"],
                correctAnswer: "Watch"),
    
       Question(q: "Como se diria adeus em espanhol?",
                a: ["Au Revoir", "Adiós", "Salir"],
                correctAnswer: "Adiós"),
    
       Question(q: "Qual destas cores NÃO aparece no logotipo do Google?",
                a: ["Green", "Orange", "Blue"],
                correctAnswer: "Orange"),
    
       Question(q: "What alcoholic drink is made from molasses?",
                a: ["Rum", "Whisky", "Gin"],
                correctAnswer: "Rum"),
    
       Question(q: "Que bebida alcoólica é feita de melaço?",
                a: ["Panda", "Gorilla", "Crocodile"],
                correctAnswer: "Gorilla"),
    
       Question(q: "Onde está localizada a Tasmânia?",
                a: ["Indonesia", "Australia", "Scotland"],
                correctAnswer: "Australia")

        
        //q = question
        //r = resposta
        //        Question(q: "Quatro + tres é igual a seis", r: "True"),
        //        Question(q: "Cinco - tres é menor que 1", r: "True"),
        //        Question(q: "Tres + oito é igual a maior que 10", r: "False"),
        
        // Matriz 2D
        // ["Quatro + tres é igual a seis", "True"],
        // [ "Cinco - tres é menor que 1", "True"],
        // [ "Tres + oito é igual a maior que 10", "False"]
    ]
    var questionNumber = 0
    var score = 0
    mutating func checkAnswer(userAnswer: String) -> Bool { 
        if userAnswer == quiz[questionNumber].respostaCorreta{
            score +=  1
            return true
        }
        else{
            return false
        }
    }
    
    
    func getScore() -> Int {
        return score
    }
    func getQuestionText() -> String{
        //retornar o texto da pergunta que corresponde ao questionNuber atual
        return quiz[questionNumber].text
    }
    
    //pega as opcoes de escolha
    //entra na matriz de questionario pelo quiz pega o numero da questao e acessa as alterantivas do answers que esta dentro de outro array
    func getAnswers() -> [String] {
        return quiz[questionNumber].answers
    }
    
    func getProgress() -> Float{
        return Float(questionNumber) / Float(quiz.count)
        
        //o numero da pergunta atual para qual pergunta ele esta e depois dividi-lo  pelo numero total de perguntas na matriz de questionarios
      
    }
    
    mutating func nextQuestion(){
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        }
        else
        {
            questionNumber = 0
            score = 0
        }
      
    }
    
   
}

