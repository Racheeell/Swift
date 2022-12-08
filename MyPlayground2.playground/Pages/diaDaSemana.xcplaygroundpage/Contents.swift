import UIKit


func diaDaSemana(){
  
    let numero = Int.random(in: 0...7)
    
    switch numero {
    case 1:
        print("Segunda-Feira")
    case 2:
        print("Terca-feira")
    case 3:
        print("Quarta-feira")
    case 4:
        print("Quinta-quinta")
    case 5:
        print("Sexta-feira")
    case 6:
        print("Sábado")
    case 7:
        print("Domingo")
    default:
        print("Error")
    }
}

diaDaSemana()
