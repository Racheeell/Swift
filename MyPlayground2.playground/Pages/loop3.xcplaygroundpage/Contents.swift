//Um conjunto de sequencias ordenadas se chama Set, tipo de colecao mais eficiente que permite colocar muitos e muitos itens
let fruits: Set = ["Apple", "Pear","Orange"]
//let fruits = ["Apple", "Pear","Orange"]
let contacts = ["Adam": 1234567890, "James": 9787867687, "Amy": 8786879]
let word = "supercalifragilisticexpialidous"
let halfOpenRange = 1..<5
let closedRange = 1...5

for fruit in fruits {
    print(fruit)
}

for person in contacts {
    print(person.key)
    print(person.value)
}

for letter in word {
    print(letter)
}

for number in halfOpenRange{
    print(number)
}
for _ in halfOpenRange {
    print("Loop is running)
}

        
