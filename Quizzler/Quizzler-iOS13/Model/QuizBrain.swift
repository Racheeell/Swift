//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Rachel Arruda Lima on 05/07/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain{
    //matriz de questionarios
    let quiz =
    [
        Question(q: "O sangue de uma lesma é verde ?", r: "True"),
        Question(q: "Aproximadamente um quarto dos ossos humanos estão nos pés.", r: "True"),
        Question(q: "A área de superfície total de dois pulmões humanos é de aproximadamente 70 metros quadrados.", r: "True"),
        Question(q: "Em West Virginia, EUA, se você acidentalmente bater em um animal com seu carro, você pode levá-lo para casa para comer.", r: "True"),
        Question(q: "Em Londres, no Reino Unido, se você morrer na Câmara do Parlamento, tecnicamente tem direito a um funeral de estado, porque o prédio é considerado um local sagrado demais.", r: "False"),
        Question(q: "É ilegal fazer xixi no oceano em Portugal.", r: "True"),
        Question(q: "Você pode levar uma vaca escada abaixo, mas não subir escadas.", r: "False"),
        Question(q: "O Google foi originalmente chamado de 'Backrub'..", r: "True"),
        Question(q: "O nome de solteira da mãe de Buzz Aldrin era 'Moon'.", r: "True"),
        Question(q: "O som mais alto produzido por qualquer animal é de 188 decibéis. Esse animal é o elefante africano.", r: "False"),
        Question(q: "Nenhum pedaço de papel quadrado seco pode ser dobrado ao meio mais de 7 vezes.", r: "False"),
        Question(q: "O chocolate afeta o coração e o sistema nervoso de um cão; algumas onças são suficientes para matar um cão pequeno.", r: "True")
        
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
        if userAnswer == quiz[questionNumber].answer{
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

