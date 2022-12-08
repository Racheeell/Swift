
import Foundation

class Animal {
    var name: String
    
    init(n: String)
    {
        name = n
    }
    
}

class Human: Animal{
    func code(){
        print("Typing away")
    }
}

class Fish: Animal{
    func breatheUnderWater(){
        print("Breating under water.")
    }
}
//
//let angela = Human(n: "Angela Yu")
//let jack = Human(n: "Jack Bauer")
//let nemo = Fish(n: "Nemo")
//
//let neighbours = [angela, jack, nemo]
//
//func findNemo(from animals: [Animal]){
//    for animal in animals {
//        if animal is Fish {
//            print(animal.name)
//            let fish = animal as! Fish
//            fish.breatheUnderWater()
//        }
//    }
//}
//findNemo(from: neighbours)
//
//let fish = neighbours[1] as! Fish


let angela = Human(n: "Angela Yu")
let jack = Human(n: "Jack Bauer")
let nemo = Fish(n: "Nemo")
let num = 12

//Any permite mistura qualquer tipo dentro da matriz
let neighbours: [Any] = [angela, jack, nemo, num]
/*Angela e nemo sao instancias criadas apartir de classe, enquanto o inteiro é criado apartir da estrtutura, ou seja, a palvra-chave "any", permite misturar classes, estruturas ou qualquer tipo de dados
 
 AnyObject restringe os tipos aqueles proveniente de classes, em outras palavras, as estruturas nao podem mais ser reproduzidas e nao podem mais fazer parte de nossa colecao. E numeros inteiros, sequencias de caracteres e duplas, todas essas sao estruturas, e é por isso que obtemos esse erro.No
 let neighbours: [AnyObject] = [angela, jack, nemo, num]
 */
