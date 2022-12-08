//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var bitcoinLabel: UIStackView!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        // Do any additional setup after loading the view.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    let coinManager = CoinManager()
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    
    /*Este método espera uma String como saída. A String é o título de uma determinada linha. Quando o PickerView estiver carregando, ele solicitará ao seu delegado um título de linha e chamará o método acima uma vez para cada linha. Então, quando ele está tentando obter o título para a primeira linha, ele passará um valor de linha de 0 e um valor de componente (coluna) de 0.
     Então, dentro do método, podemos usar a linha Int para escolher o título do nosso currencyArray.*/
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        /*Isso será chamado toda vez que o usuário rolar o seletor. Quando isso acontecer, ele registrará o número da linha que foi selecionada.
         
         Vamos imprimir esse número de linha para ver qual é selecionado quando rolamos nosso UIPickerView.*/
        //print(row)
        
        //passa a moeda selecionada para o CoinManager por meio do metodo getCoinPrice
        let selectCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectCurrency)
    }
}

