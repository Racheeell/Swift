struct Town {
    let name = "Angelaland"
    var citizens = ["Angela", "Jack Bauer"]
    var resources = ["Grain": 100, "Ore": 42, "Wool": 75]
    
    func fortify()
    {
        print("As defesas aumentaram!")
    }
}

var myTown = Town()

print(myTown.citizens)

print("\(myTown.name) tem \(myTown.resources["Grain"]!) sacos de graos")

myTown.citizens.append("Keanu Reeves")
print(myTown.citizens.count)

myTown.fortify()
