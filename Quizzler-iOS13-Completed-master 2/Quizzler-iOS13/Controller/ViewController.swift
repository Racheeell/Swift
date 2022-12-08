//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
   
 
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
   
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        //Int.random roda aleatorio
//        imageView.image = ballArray[Int.random(in: 1...5)]
    }
//Novo botão também precisa ser vinculado a esta IBAction.
    
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
        // busca as respostas e atualizar os títulos dos botões usando o método setTitle.
        let answerChoices = quizBrain.getAnswers()
        
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        
        //O terceiro botão também precisa ser redefinido.
        choice3.backgroundColor = UIColor.clear
//        trueButton.backgroundColor = UIColor.clear
//        falseButton.backgroundColor = UIColor.red
//
       
    }
}
