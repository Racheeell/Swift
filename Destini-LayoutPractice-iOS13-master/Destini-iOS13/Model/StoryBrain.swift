//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation


struct StoryBrain{
    
    var storyNumber = 0
   
    // Question(q: "A slug's blood is green.", r: "True"),
    let stories = [
   
    Story(
        title: "Ele balança a cabeça lentamente, imperturbável com a pergunta.",
        choice1: "Pelo menos ele é honesto. eu vou subir.",
            choice1Destination: 2,
        choice2: "Espere, eu sei como trocar um pneu.",
            choice2Destination: 3
    ),
    Story(
        title: "Quando você começa a dirigir, o estranho começa a falar sobre seu relacionamento com a mãe. Ele fica cada vez mais irritado a cada minuto. Ele pede para você abrir o porta-luvas. Dentro você encontra uma faca ensanguentada, dois dedos decepados e uma fita cassete de Elton John. Ele pega o porta-luvas.",
        choice1: "Eu amo o Elton John! Entregue-lhe a fita cassete.", choice1Destination: 5,
        choice2: "É ele ou eu! Você pega a faca e o esfaqueia.", choice2Destination: 4
    ),
    Story(
        title: "O que? Tal policial fora! Você sabia que os acidentes de trânsito são a segunda principal causa de morte acidental para a maioria das faixas etárias adultas?",
        choice1: "The",
            choice1Destination: 0,
        choice2: "End",
            choice2Destination: 0
    ),
    Story(
        title: "À medida que você atravessa o guard-rail e se inclina em direção às rochas irregulares abaixo, você reflete sobre a sabedoria duvidosa de esfaquear alguém enquanto eles estão dirigindo um carro em que você está.",
        choice1: "The",
            choice1Destination: 0,
        choice2: "End",
            choice2Destination: 0
    ),
    Story(
        title: "Você se relaciona com o assassino enquanto canta versos de 'Can you feel the love hoje à noite'. Ele te deixa na próxima cidade. Antes de você ir, ele pergunta se você conhece algum lugar bom para despejar corpos. Você responde: 'Experimente o cais.'",
        choice1: "The",
            choice1Destination: 0,
        choice2: "End",
            choice2Destination: 0
    )
]
    //coloca a historia no label
    func getStoryTitle() -> String {
        return stories[storyNumber].title
    }
    //se escolher o  choice1 ele pegar o destino1
    func getChoice1() -> String {
        return stories[storyNumber].choice1
    }
    //se escolher o  choice2 ele pegar o destino2

    func getChoice2() -> String {
        return stories[storyNumber].choice2
    }
    
   
    
  //depende do usuario userChoice escolher um dos botoes ele segue um destino
    mutating func nextStory(userChoice: String){
    
        let currentStory = stories[storyNumber]
        if userChoice == currentStory.choice1{
            storyNumber = currentStory.choice1Destination
        }
        else if userChoice == currentStory.choice2
        {
            storyNumber = currentStory.choice2Destination
        }
        
      
    }
}
//    var score = 0
//
//    if userChoice == historias(choice1Destination[0]).choice1Button{
//        score +=  1
//        return true
//    }
//    else{
//        return false
//    }

// func checkChoice(userAnswer: String) -> Bool {
//    if userAnswer == historias[questionNumber].opUm {
//        score += 1
//        return true
//    } else {
//        return false
//    }
//}

