//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    //intancia de um objeto
    var calculatorBrain = CalculatorBrain()

    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
       // print(heightLabel.text = String(format: "%.2f", sender.value))
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
        
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        //print(weightLabel.text = String(format: "%.0f", sender.value))
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
       
        //print("\(resultado)")
        
        //criacao de objeto
        //inicializao do projeto da tela 2 
//        let secondVC = SecondViewController()
//        secondVC.bmiValue = String(format: "%.1f", resultado)
//        self.present(secondVC, animated: true, completion: nil)

        //A partir do controlador de exibicao, podemos acionar o metodo que é o codigo herdado performSegue
        
        //para realizar uma seguencia, tem que inserir o identificador
        performSegue(withIdentifier: "goToResult", sender:  self)
    }
    //substituindo o metodo preparar pra seguir
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //primeiro verificar se os segue.identifier é igual ao identificador que atribuimos "goToResult" que vai para a tela de resultados
        if segue.identifier == "goToResult"
        {
            //dizendo que o destino da segunda tela é o result...
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
            
        }
    }
}

