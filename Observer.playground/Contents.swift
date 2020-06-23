import Cocoa

// Observer Pattern

// Burada 3 tane başlık var

// Subject , Client , Observer

// Subject  içersinde dinlenmesi gereken değişkenler fonksiyonlar var içersinde observer nesnesi de var
// Observer subject içersinde değişen obje ile trigger olmak için dinlemek için var
//


protocol ObserverProtocol {
    func update(_ name :String) -> Bool
}

class observerClass : ObserverProtocol {
    func update(_ name: String) -> Bool {
        print("Eklenen veri -> \(name)")
        return name.count > 5  ? true : false
    }
}

class sbjClass {
    private var obsever : ObserverProtocol?
    init(observer:ObserverProtocol) {
        self.obsever = observer
    }
    var name:String = "" {
        willSet {
            self.obsever?.update(newValue)
        }
    }
}
let observer = observerClass()

let subject = sbjClass(observer: observer)
subject.name = "Deneme123"

