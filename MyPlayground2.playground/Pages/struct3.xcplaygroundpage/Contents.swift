struct User{
    var name : String
    var email : String?
    var followers : Int
    var isActive : Bool
        
    init (name: String, email: String?, followers: Int, isActive: Bool){
        self.name = name
        self.email = email
        self.followers = followers
        self.isActive = isActive
    }
        func logStatus()
        {
        if isActive == true
        {
            print("XXX está trabalhando duro")
        }
        else{
            print("XXX saiu da terra ")
        }
    }
}
var anotherUser = User(name: "Richard", email: "", followers: 0, isActive: false)

var ghostUser = User(name: "Elon", email: "elon@tesla.com", followers: 2001, isActive: true)
ghostUser.logStatus()
print("Entrando em contato com o \(anotherUser.name) em \(anotherUser.email!)...")
print("\(anotherUser.name) tem \(anotherUser.followers) followers")


print("Entrando em contato com o \(ghostUser.name) em \(ghostUser.email!)...")
print("\(ghostUser.name) tem \(ghostUser.followers) followers")
//algum tempo depois
anotherUser.isActive = true
anotherUser.logStatus()

ghostUser.isActive = false
ghostUser.logStatus()
