import UIKit

func loveCalculator(){

    let loveStore = Int.random(in: 0...100)
    
//    if loveStore == 100 {
//        print("Voce esta com muita fome")
//    }
//    if loveStore > 80
//    {
//       print("Voce esta com muita fome")
//    }
//    else if loveStore > 40 && loveStore <= 80
//    {
//        print("Voces querem coca-cola e mentos")
//    }
//
//    else {
//        print("Voce nao esta sentindo fome")
//    }
    
    
    switch loveStore {
        
    case  81...100:
        print("Voce esta com muita fome")
    case 41..<81:
        print("voce esta com pouca fome")
    case ...40:
        print("voces nao esta com fome")
    default:
        print("esta com a barriga cheia")
    }
}

loveCalculator()


