//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Rachel Arruda Lima on 28/07/22.
//

import SwiftUI

struct ContentView: View {
    //permitira atualizar a variavel e fazer com que o swift recrie esse contentview sempre que o valor dessa variavel for alterado ou atualizado
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    var body: some View {
        ZStack {
            Image("background")
            //combo para preencher tudo do plano de fundo
                .resizable()
                .edgesIgnoringSafeArea(.all)
            //pilha vertical
            VStack {
                Image("diceeLogo")
                //espacamento
                Spacer()
                //pilha horizontal
                HStack {
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                .padding(.horizontal)
                //espacamento
                Spacer()
                Button( action: {
                    leftDiceNumber = Int.random(in: 1...6)
                    rightDiceNumber = Int.random(in: 1...6)
                })
                {
                    Text("Roll")
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    }
                .background(Color.red)
                    
                }
            }
        }
    }


struct DiceView: View {
    //inicializara a imagem com um numero de dados especifico
    let n: Int
    
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
