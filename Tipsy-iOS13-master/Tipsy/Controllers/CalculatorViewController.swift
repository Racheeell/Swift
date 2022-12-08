//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zerooPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var result = 0
    var numberOfPeople = 2

    @IBAction func tipChanged(_ sender: UIButton) {
        //propriedade is Selected para fazer um botao ter um plano de fundo e aparecer selecionado
      
//
        zerooPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        //Set the numberOfPeople property as the value of the stepper as a whole number.
        numberOfPeople = Int(sender.value)
}
    @IBAction func calculatePressed(_ sender: UIButton) {
//      
        var result: Float
        var fatura = String(format: "%.2f", sender.value)
        billTextField.text = Float(fatura)
        
        
        if zerooPctButton.isSelected == true {
            result = Float(((0/100) * fatura) / numberOfPeople)
            print(result)
        }
        else if tenPctButton.isSelected == true {
            result = Float(((10/100) * fatura) / numberOfPeople)
            print(result)
        }
        else if twentyPctButton.isSelected == true {
            result = Float(((20/100) * fatura) / numberOfPeople)
            print(result)
        }
      
    }
}

