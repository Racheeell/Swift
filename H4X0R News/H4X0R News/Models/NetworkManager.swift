//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Rachel Arruda Lima on 28/07/22.
//

import Foundation
/*Se for capaz de gerar um URL a partir dessa string, cria um objeto de sessao da classe URLSession e inicializá-lo usando uma configuracao padrao.
 Em seguida, criaria uma tarefa que sera configurada para sessao.tarefadedados e escolher o inicializador que usa uma URL e possui um completeHandler com os dados que recebemos de volta a resposta e o  erro. Portanto, o URL que vamos usar para fazer esse solicitacao é obviamente, o URL que geramos aqui. ENtao, na conclusao Handler, eu apenas vou seleciona-lo e pressionar enter, para que ele o divida em um formato de fechamento a direita. Portanto, os dados serao chamados de dados, a resposta será chamada de reposta e o erro sera um erro de codigo. ENtao, agora dentro do fechamento, vou verificar se o erro é igual a zero.
 OS dados que recuperar estao no formato em JSON.
 Tem que refatorar.
 Primeiro tem que criar um decodificador que é criado a partir do decodificador JSON. E enatotentar fazer com que nosso decodificador JSON decodifique os dados que recuperarmos de nossa sessao de rede.
 Para fazer isso, no entanto, primeiro precisamos criar uma estrutura para representar todas as propriedade que queremos desse resultado.
 Ou seja o arquivo PostData que esta na pasta de models
 */

/*COMO PASSAR OS RESULTS DO NETWORKMANGAER PARA A LISTA DENTRO DO CONTTENTVIEW?
 Fazer o networkManager estar em conformidade com um protocolo chamado ObservableObject, isso significa que ele pode realemnte comecar a transmitir uma ou muitas de seus propriedades para todas as partes interessadas
 */
class NetworkManager: ObservableObject {
    //publicar as posts para todas as partes interessadas
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){(data, response, error) in
                if error ==  nil {
                    let decoder = JSONDecoder()
                    //usando o decodificador para decodificar e o tipo sera Result.self , que é o tipo de dados dessa estrutura e os dados vem From: de data, esse dado que volta da rede é opcional. Opcionalmente, vincule-o a algo chamado de dados seguros para refletir safeData = data, podendo usar safeData e isso permite trabalhar com dados opcionais. ENtao o decodificador. decodifica, esse metodo de decodificacao, porque ele pode ser lancado, significa que precisa chama-lo usando a palavra chave "try". e se quiser detectar algum erro que ocorra durante esse processo de tentativa de decodificacao, deve agrupar o metodo dentro de um bloco do catch e imprimir quaisquer erros que ocorram como resultado desse metodo
                    if let safeData = data {
                        do{
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                       
                    }
                }
            }
            //fechamneto da tarefa
            task.resume()
        }
    }
}
