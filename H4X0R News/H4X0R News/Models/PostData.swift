//
//  PostData.swift
//  H4X0R News
//
//  Created by Rachel Arruda Lima on 28/07/22.
//

import Foundation

/*Estrutura em conformidade com o protocolo decodificavel, para que possamos realemnte usar o decodificador JSON para decodificar nossos dados JSON em uma estrutura Result.
 
    hits terao o formato de dados de uma matriz de objetos Post.
    A estrutura POst, que decodificara a partir desse resultado JSON todas as quatro propriedade em que estamos interessados.
     Torna o POst identificavel (identifiable)
     PAra que algo seja identificavel, ele deve ter um ID do codigo de propriedade.
     SO precisa do protocolo Identificavel para usar essa estrutura na lista que esta no (ContentView)
    e para que a lista saiba como solicitar cada item.
    Entao, agora que criamos nosso Results e Post, pode decodificar os dados
 */
struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
