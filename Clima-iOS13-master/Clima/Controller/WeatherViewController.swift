//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

//UITextFieldDelegate permitirá que nossa classe, nosso controlador de
//visualizao do tempo, gerencie a edicao e validacao de texto em um campo de texto

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    //usado paralocalizar o gps no telefone
    let locationManager = CLLocationManager()
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*Para obter a notificacao, precisa definir WeatherViewController,
         para classe atual seja o delegate do locationManager*/
        locationManager.delegate = self
        
        /*Acionar uma solicitacao de permissao
         O requestWhenlnUseAuthorization. Como a localizao do usuario é realmente de dado privado, voce nao deseja que os aplicativos saibam exatamente onde estao sem precisar pedir permissao explicita. Entao aparecera na tela solicitando permissao ao usuario
         
         */
        locationManager.requestWhenInUseAuthorization()
        /*monitora a localizao e relat constantemente quando é atualizado*/
        //locationManager.startUpdatingLocation()
        //usado para pegar a localizacao da solicitacao é suficiente
        locationManager.requestLocation()
        
        //self = se refere ao controlador de exibicao atual
        //o campo de texto deve reportar de volta ao nosso controler de exibicao, ou seja, quando o usuario digitar algo, o campo de texto notifica nosso controlador de exibicao sobre o que esta acontecendo
        /*o WeatherManager. delegate propriedade é igual a self. Dessa forma,
          a propriedade delegate do nosso WeatherManager*/
        weatherManager.delegate = self
        searchTextField.delegate = self
        
    }
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
}


//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)// depois de acabar de escrever pode descartar o teclado
        print(searchTextField.text!)
    }
    
    //FUNCAO para retornar por meio do ENTER DO TECLADO, o valor digitado
    // retornar um verdadeiro ou falso que diga ao campo de texto se ele deve realmente processar esse retorno.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        
        //retornar true pq é uma funcao que espera um booleano como saida, para o campo de texto possa realmente retornar.
        return true
    }
    
    //metodo de delegacao
    //Should = Deveriam
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //verificar se o textField a propriedade text nao é igual a uma string vazia
        if textField.text != ""
        {
            return true
        }
        else
        {
            textField.placeholder = "Digite algo"
            return false
        }
    }
    
    
    //o delegate quem é notificado
    //esse metodo funciona como limpar o campo de texto depois que foi pesquisado
    // o sublinhado atras do textField
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        if let city = searchTextField.text{
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate{
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    {
        DispatchQueue.main.async{
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
        //print(weather.temperature)
    }
    /*definimos a classe como delegate e implementacao do didUpdateWeather seja notificada quando o
     tempo estiver disponivel na internet*/
    
    
    func didFailWithError(error: Error) {
        print(error)
    }
}


//MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        /*last é um opcional, para usa-lo, deve opcionamente vincular-lo a uma nova constante chamada local,
         para que o desembrulhe.Entao, dentro desse bloco, pode - se criar uma latitute que sera igual a localizao coordenada  */
        if let location = locations.last
        {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
