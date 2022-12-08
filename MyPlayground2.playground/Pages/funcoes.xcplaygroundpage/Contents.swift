//: [Previous](@previous)


//PASSAR FUNCOES COMO ENTRADAS PARA OUTRAS FUNCOES E
//TAMBEM PODE USAR FUNCOES COMO O TIPO DE RETORNO
import UIKit

func calculator (n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    
    return operation(n1, n2)
   // return n1 * n2
}
 
calculator(n1: 2, n2: 3, operation: { (no1: Int, no2: Int) -> Int in
    return no1 * no2
})

//calculator(n1: 2, n2: 3)
let result = calculator(n1: 2, n2: 3) {$0 * $1}
//print(result)
//
//func multiply (no1: Int, no2: Int) -> Int {
//    return no1 * no2
//}
//
//calculator(n1: 2, n2: 3, operation: multiply)
//}
