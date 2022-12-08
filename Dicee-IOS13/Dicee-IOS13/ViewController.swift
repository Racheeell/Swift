//
//  ViewController.swift
//  Dicee-IOS13
//
//  Created by Rachel Arruda Lima on 22/06/22.
//

import UIKit

class ViewController: UIViewController {

    //IBOutlet me permite fazer referência a um elemento de interface do usuário
  
    @IBOutlet weak var diceImageView1: UIImageView!
    
    @IBOutlet weak var diceImageView2: UIImageView!
    
    var leftDiceNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        diceImageView1.image = UIImage(imageLiteralResourceName: "DiceSix")
//        diceImageView2.image = UIImage(imageLiteralResourceName: "DiceTwo")
        
        //Quem          O que    valor
        //diceImageViewOne.image =
       // diceImageTwo.image =
    }
   
    @IBAction func rollButtonPressed(_ sender: UIButton) {
    //leftDiceNumber = 1
        print("leftDiceNumber at beginning = \(leftDiceNumber)")
        
        diceImageView1.image =
            [ UIImage( named: "DiceOne"),
             UIImage( named: "DiceTwo"),
             UIImage( named: "DiceTree"),
             UIImage( named: "DiceFour"),
             UIImage( named: "DiceFive"),
             UIImage( named: "DiceSix")]
            [leftDiceNumber]
    
    leftDiceNumber = leftDiceNumber + 1
        
        print("leftDiceNumber at the end = \(leftDiceNumber)")
        
    }
    
}

