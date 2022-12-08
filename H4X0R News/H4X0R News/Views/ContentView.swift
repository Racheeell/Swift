//
//  ContentView.swift
//  H4X0R News
//
//  Created by Rachel Arruda Lima on 28/07/22.
//

import SwiftUI

struct ContentView: View {
    
    //para ouvi-lo sempre que o conteudo for alterado. cria um objeto a partir dessa classe chamando o networkManager
    /*O ObservableObject é um protocolo para tornar o networkMAnager observavel. ENtao uma ou muitas de suas propriedades podem ser publicadas para dizer que, sempre que houver alteracoes, notificar todos os ouvintes. E para configurar uma propriedade como ouvinte, adiciona o wrapper de propriedade @ObservedObject. Dessa forma, esta assinando as atualizacoes do networkManager..Portanto, agora, sempre que o networkManager for atualizado, isso sera acionado. E podemos usar o networkManager.public  para atualizar a lista.
     Portanto, sempre que a publicacao é alterada, isso desencadeia uma reconstrucao da nossa lista, atualizando tudo o que esta dentro.*/
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)){
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                /*Para cada item da matriz de postagens, cada uma delas sera chamada de postagem no formato singular, e entao adicionarei a palavra-chave "in" que mostra que este é o comeco do encerramento*/
                
            }
            .navigationBarTitle("H4X0R NEWS")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct Post: Identifiable {
//    let id: String
//    let title: String
//}
//
//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "Hola")
//]
