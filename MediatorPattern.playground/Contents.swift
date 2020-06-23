import Cocoa

protocol MessageProtocol{
    func sendMessages()
}

class MessageMeditatior : MessageProtocol {
    
    private var messagesList : [Message] = []
    
    func add(_ message:Message){
        self.messagesList.append(message)
    }
    
    func sendMessages() {
        for item in self.messagesList {
            item.user.sendMessage(item.message)
        }
    }
}

class Message {
    var user  = User()
    var message : String = ""
    init(user:User , message:String) {
        self.user = user
        self.message = message
    }
}
class User {
    private var username : String?
    
    func getUsername()->String?{
        return self.username
    }
    func setUsername(_ name:String?){
        self.username = name
    }
    func sendMessage(_ text:String) {
        print("\(String(describing: self.username)) sending - > \(text)")
    }
}
let user_1  = User()
user_1.setUsername("Özgür")
let user_2 = User()
user_2.setUsername("Hasan")
let messageMediatör = MessageMeditatior()
messageMediatör.add(Message(user: user_1, message: "Selam dostum"))
messageMediatör.add(Message(user: user_2, message: "Selam kardeşim , naber ? "))

messageMediatör.sendMessages()
