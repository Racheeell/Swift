//: [Previous](@previous)

import UIKit

let pizzaInInches: Int = 12

var numberOfSlices: Int {
    return pizzaInInches - 4
}

print(numberOfSlices)

func calcPizzaSlices(){
    numberOfSlices = pizzaInInches - 4
}

calcPizzaSlices()
print(numberOfSlices)

