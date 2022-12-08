struct Town {
    let name: String
    var citizens: [String]
    var resources: [String: Int]
    
    //init(townName: String, people: [String], stats: [String: Int])
    init(name: String, citizens: [String], resources: [String: Int])
    
    {
        //name = townName
        //citizens = people
        //resources = stats
        self.name = name
        self.citizens = citizens
        self.resources = resources
    }
    
    func fortify()
    {
        print("As defesas aumentaram!")
    }
}

var anotherTown = Town(name: "Nameless Island", citizens: ["Tom Hanks"], resources: ["Coconuts": 100])

var ghostTown = Town(name: "Ghosty McGhostface", citizens: [], resources: ["Tumbleweed": 1])

anotherTown.citizens.append("Wilson")
print(anotherTown.citizens)
