import Cocoa

// Interpreter Desing Pattern

// Sayısal ve mantıksal işlemler için kullanılan patterndir.
// Örnek olarak cryptolanmış bir metinin veya bozuk piksellere sahip bir resimi bu resimin veya metinin düzeltilmesinde kullanılan patterndr.

// Bunların yapılması için içersinde kural motoruna ihtiyaç duyarlar
// İşlenecek veri bir Context şekilinde tutulur ve bu context Abstract Expression'a Terminal ve NonTerminal Expression yoluyla taşınır.

class Context {
    var text:String?
    var uniCode:String?
    init(t:String? = nil , u:String? = nil) {
        self.text = t
        self.uniCode = u
    }
}
protocol expression {
    func interpreter(_ context:Context)
    func unicodeConverter(_ string:String)->String
}
class uniCodeExpression: expression {
    func interpreter(_ context: Context) {
        guard let text = context.text else {return}
        context.uniCode = self.unicodeConverter(text)
    }
    
    func unicodeConverter(_ string: String) -> String {
        var uniCodes : [String] = []
        string.unicodeScalars.compactMap { (u)  in
            uniCodes.append(String(u.value))
        }
        return uniCodes.joined()
    }
}

let context : Context = Context(t: "özgür")
let unicodeExpression = uniCodeExpression()
unicodeExpression.interpreter(context)
print(context.uniCode ?? "Any")

    
