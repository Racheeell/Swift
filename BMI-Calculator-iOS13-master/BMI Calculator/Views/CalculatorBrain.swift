//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Rachel Arruda Lima on 10/07/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain{
    
    //valor padrao
    var bmi: BMI? //opcional
    
    //e retornando o imc
    func getBMIValue() -> String
    {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }

    
    func getAdvice() -> String{
        return bmi?.advice ?? "No device"
        
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.white
    }
    
    
    //calculando o IMC em uma estrutura separada
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / (height * height)
    //bmiValue = String(format: "%.1f", resultado)
        
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "Eat more pies !", color: UIColor.blue)
        }
        else if bmiValue < 24.9
        {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.green)
        }
        else{
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor.red)
        }
    }
}
   
