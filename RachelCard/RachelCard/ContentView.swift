//
//  ContentView.swift
//  RachelCard
//
//  Created by Rachel Arruda Lima on 27/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            //cor de fundo
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .edgesIgnoringSafeArea(.all)
            VStack {
                //imagem
                Image("ft")
                    .resizable()
                //tamanho da foto
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0, height: 150.0)
                    .clipped()
                //moldar a foto em circulo
                    .clipShape(Circle())
                    .overlay(
                        //borda do retrato
                        Circle().stroke(Color.white, lineWidth: 5))
            

                Text("Rachel Lima")
                    .font(Font.custom("EduVICWANTBeginner-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("IOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
               
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .frame(width: 350.0, height: 50.0)
                    .foregroundColor(.white)
                    .overlay(HStack {
                        Image(systemName: "phone.fill")
                            .foregroundColor(.green)
                        Text("+55 11 96971-8128").foregroundColor(.black)
                    })
                    .padding(.all)
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .frame(width: 350.0, height: 50.0)
                    .foregroundColor(.white)
                    .overlay(HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.black)
                        Text("Rachel.Lima@ibm.com").foregroundColor(.black)
                    })
                    .padding(.all)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
