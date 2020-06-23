import Cocoa

// State Design Pattern


// Durum değişikliğine göre davranış sunan pattern.
// State nesnesinin durumuna göre
// State interfaceleri oluşuturul ve class ın davranışına göre bu implement edilir.
// State durumuna göre handle edilen şey değişir
// tek bir context üzerinden birden çok durum değişikliği handle edilebbilir hale geliyor.
protocol UserState  {
    func control( _ context: UserControlContext)
}

class Admin : UserState {
    func control(_ context:UserControlContext) {
        print("This user is admin")
    }
}
class Subs: UserState {
    func control(_ context: UserControlContext) {
        print("This user is subs")
    }
}
class Normal: UserState {
    func control(_ context:UserControlContext) {
        print("This user is normal people")
    }
}

class UserControlContext {
    // if keypass is A who is Admin
    // if keypass is S who is Subs
    // if keypass is N who is Normal
    var keyPass = ""
    
    private var currentUserState : UserState

    init() {
        self.currentUserState = Normal()
        self.currentUserState.control(self) // control
    }
    func  changeUserType(_ str :String)  {
        if str == "A" {
            self.currentUserState = Admin()
        }else if str == "S"{
            self.currentUserState = Subs()
        }else {
            self.currentUserState = Normal()
        }
        self.currentUserState.control(self)
    }
    
}

func main(){
    let context = UserControlContext()
    context.changeUserType("S")
    context.changeUserType("A")
}
main()
