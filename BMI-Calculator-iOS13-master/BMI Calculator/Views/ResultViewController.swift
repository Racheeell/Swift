//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Rachel Arruda Lima on 10/07/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

//resultViewcontroller esta herdando do uiviewcontrolller

class ResultViewController: UIViewController {

    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
    
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        //volta a tela anterior
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
