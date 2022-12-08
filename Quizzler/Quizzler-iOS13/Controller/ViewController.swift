//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        //Int.random roda aleatorio
//        imageView.image = ballArray[Int.random(in: 1...5)]
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //True, False
        //chamar o metodo quizbrain.checkAnswer e adicionar os parametros entre parenteses e o argumento depois dos dois pontos que vai ser a resposta do usuario
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }
        else
        {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
       
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.red
        
       
    }
}
