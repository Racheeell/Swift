//
//  WeatherData.swift
//  Clima
//
//  Created by Rachel Arruda Lima on 14/07/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation


//conformidade com o protocolo Decadable, ou seja, transformou em um tipo que pode decodificar-se a partir de uma representacao externa, a representacao JSON. Agora que o WeatherData é Decodable possui uma propriedade chamada name
struct WeatherData: Decodable {
    let name: String
    // O tipo de dado do main é uma struct mané 
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
/*Os nomes das propriedades devem corresponder exatamento aos nomes das propriedades dos dados do JSON */
    let temp: Double
}



struct Weather: Decodable{
    let description: String
    let id: Int
}
