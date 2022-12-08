//
//  WeatherManager.swift
//  Clima
//
//  Created by Rachel Arruda Lima on 13/07/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    //os requisitos sao os deve poder implemetar um codigo na funcao didUpdateWeather
    //as entradas sao chamadas de weather e devem ser do tipo WeatherModel
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    
    //ajudara a transmitir erros do gerenciador de clima
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=42edea29d54742325f33882f339aac3a&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        // self  chamando a propria funcao do performeRequest
        self.performRequest(urlString: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlString: urlString)
    }
    
    
    
    func performRequest(urlString: String){
        //  NETWORKING
        //1. Create a URL
        if let url = URL(string: urlString){
            
            
            // 2. Create a URLSession
            // Configuracao padrao
            let session = URLSession(configuration: .default )
            
            /* 3. GIVE THE SESSION A TASK
             Acessar a informacao que acabamos de criar e fornecer uma tarefa
             de dados com url e manipulador criar uma tarefa que recupera o
             conteudo da URL especifica, em seguida, chama um manipulador ou
             metodo */
            
            let task = session.dataTask(with: url) { data, resposnse, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    //print(error!)
                    //return significa sair dessa funcao e nao continuar
                    return
                }
                
                /*se nao houver erros, chamarei safeData, que usara a ligacao opcional para desembrulhar meu objeto de dados que voltei
                 Passa nossos dados seguros aqui e passa-los em uma string.
                 E a codificacao para a maioria dos dados que retornamos da web é \
                 UTF-8 este e apenas um protocolo padronizado para codificar textos em
                 sites
                 */
                if let safeData = data {
                    //chamar o metodo parseJson aqui e passar esse safeData desembrulhando que atende aos requisitos de ser um objeto de dados
                    if let weather = self.parseJSON(weatherData: safeData)
                    {
                        //let weatherVC = WeatherViewController()
                      
                        // para reutilizar essa estrutura e nao usar nenhum codigo especifico nele que o vincule a outro objeto, usando um delegate
                        //esta usando um fechamento, o delegate precisa ter a palavra-chave "self" na frente para deixar claro que se refere ao delegate na classe atual, que é a WeatherViewCOntroller
                        self.delegate?.didUpdateWeather(self, weather: weather)
                        
                        /*WeatherManager nao é nula. Entao, onde chamammos de delagate.didUpdateWeather, esse encadeamento opcional aqui realmente passara porque nao é nulo, e entao acionamos esse didUpdateWeather e passamos sobre esse objeto climatico. 
                         
                         chamando o weatherVC.didUpdateWeather, e poderiamos passar esse objeto climatico como entrada. POREM voltando as aulas de delegates e protocolos, tornaria o uso unico do weatherManager
                        
                         weatherVC.didUpdateWeather(weather)
                         */
                        
                        
                         }
                }
            }
            //let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            /*O metodo dataTask retorna um URLSession.Assim, podemos definir a
             saida como uma tarefa de codigo constante
             O que é completionHandler? é um metodo/funcao, ele assume uma
             funcao como entrada
             (Data?)espera uma entrada que precisa ser de dados opcionais do
             tipo data, depois outra que é (URLResponse?) opcional e outra que
             é(Error?) um erro opcional
             
             Conclusao: o objeto (task )da tarefa chame esse metodo(handle) sempre que terminar de extrair os dados da internet, permite nos continuar com outras coisas e acionar apenas nossa declaracao de impressao ou o que mais precisarmos a ver com a sequencia assim que o processo for concluido. Portanto, embora esse metodo funcione onde criamos um metodo e passamos o handle aqui como valor de entrada*/
            
            //4. Start the task
            task.resume()
            /*
             No caso de tarefas, porque elas podem ser suspensas e, de fato,
             as tarefas recem-inicializadas. Elas comecam em um estado
             suspenso. Entao precisa chamar esse metodo para iniciar a tarefa,
             //bascamente
             */
        }
    }
    
    //a unica entrada sera weatherData, o formato dos dados é o que recuperamos da dataTask(Data)
    func parseJSON(weatherData: Data) -> WeatherModel? {
        /*criacao de um decodificador
         a partir do objeto decodificador do JSON, portanto, este é um
         objeto que pode decoficar o JSON. Agora ele so irá inicializá-lo
         */
        let decoder = JSONDecoder()
     
        /*usar o decodificador e decodificar
        Agora ele requer duas entradas
         Primeiro: os dados que deseja decodificar
         Segundo: um tipo de Decodable. POrtanto, um tipo de dados que estamos usando para decodificar em
         conformidade com o protocolo de decodificador. É o (WeatherData) é do tipo Decodable
         Porem ele espera um tipo de entrada, nao um objeto
         Para especificar o tipo weatherData, em vez de apenas o objeto weatherData, adiciona um (.self)
         para referenciar o tipo
         
         from: os dados que queremos codificar serao passados como a ultima
         entrada e serao provenientes desse weatherData
         */
        do
        {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            //print(weather.temperatureString)
            //mostrando o objeto decodificado, o nome da cidade que foi digitada
            //print(decodedData.name)
            //print(decodedData.main.temp)
            //print(decodedData.weather[0].id)
        }
        
        catch {
            print(error)
            return nil
        }
        /*o bloco "do" tem a mesma coisa com "try" e isso marca o metodo que pode gerar um erro MAS se gerar um erro, temos um bloco de captura que pode capturar o erro*/

    }
}
