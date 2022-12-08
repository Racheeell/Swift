//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    //instancia
    var storyBrain = StoryBrain()
    
//    let story0 = "Voce ve uma bifurcacao na estrada"
//    let escolha1: String = "Vire à esquerda"
//    let escolha2: String = "Vire à direita"
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        
    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        
        updateUI()
        
    }
    
        
//    let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
//
//    if userGotItRight {
//        sender.backgroundColor = UIColor.green
//    } else {
//        sender.backgroundColor = UIColor.red
//    }
    @objc func updateUI(){
        //pegar a pergunta que esta dentro da struct storybrain pega a funcao getstorytitle que vai mandar pra label
        storyLabel.text = storyBrain.getStoryTitle()
        choice1Button.setTitle("\(storyBrain.getChoice1())", for: .normal)
        choice2Button.setTitle("\(storyBrain.getChoice2())", for: .normal)
    
    }
}
//    @objc func updateUI() {
//        questionLabel.text = quizBrain.getQuestionText()
//        progressBar.progress = quizBrain.getProgress()
//        scoreLabel.text = "Score: \(quizBrain.getScore())"
//
//        trueButton.backgroundColor = UIColor.clear
//        falseButton.backgroundColor = UIColor.clear
//    }


