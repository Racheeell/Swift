//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
//import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ANIMACAO USANDO BIBLIOTECA TERCEIRIZADA
        //titleLabel.text = "⚡️FlashChat"
        
        //ANIMACAO DO TITULO MANUALMENTE
        titleLabel.text = ""
        let titleText = K.appName
        var charIndex = 0.0
        /*O que acontece nesse ciclo completo é que para cada letra no texto do titulo "FlashChat",
         ele agenda um cronometro que aguarda, um segundo e depois adiciona a letra ao texto do titleLabel*/
        for letter in titleText {
//            print("-")
//            print(0.1 * charIndex)
//            print(letter)
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
            /*precisa ser marcado como "self" porque esta dentro de um fechamneto indicado
             por essa sintaxe que deveria ter visto antes*/
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
}
