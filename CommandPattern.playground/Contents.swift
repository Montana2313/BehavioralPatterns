import Cocoa

// Command Dizayn Pattern

// Amacımız istemci ile methodların bağlarını zayıflatmaktır.
// Ana bir clientimiz var ve çağırılmak istenen bir method var
// Client bu metodu çağırmak için kendine bir invoker sınıf oluşuturur burada
// çağırılmak istenen sınıfta yaratılır. Eğer çağırılacak sınıfta parametreler varsa bunları geçebilmek ve
// çalıştırabilmek için COMMAND nesnesi yaratır.
// yani invoker.execute , command.execute 'u , reciever methodu


// Command bir interface'dir içersindeki execute methodu ile gitmek istediği nesneye ulaşır bu sayede ana client ile ilişki zayıflar
protocol Command{
    func execute()
}
class Reciever {
    func sum(num1:Int , num2:Int , num3:Int)->Int{
        let sumResult = num1 + num2 + num3
        print(sumResult)
        return sumResult
    }
}
class InvokerSum{
    private var command:CommandSum!
    init(command:CommandSum) {
        self.command = command
    }
    func execute(){
        self.command.execute()
    }
}
class CommandSum: Command {
    private let reciever:Reciever = Reciever()
    private var num1 = 0
    private var num2 = 0
    private var num3 = 0
    //PARAMS
    init(num1:Int , num2:Int , num3:Int) {
        self.num1 = num1
        self.num2 = num2
        self.num3 = num3
    }
    func execute(){
        self.reciever.sum(num1: self.num1, num2: self.num2, num3: self.num3)
    }
}
class client{
    let sumInvoker: () = InvokerSum(command: CommandSum(num1: 2, num2: 3, num3: 4)).execute()
}
client()
