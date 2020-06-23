import UIKit



// Asludna bir State pattern gibi
// gelen context objesine göre davranışını değiştiren patterndir.
// gelen strategy'ye göre işlem değişmesi


protocol Strategy{
    func operation(num1:Int , num2:Int) -> Int
}

class sum : Strategy{
    func operation(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
}

class minus : Strategy{
    func operation(num1: Int, num2: Int) -> Int {
        return num1 - num2
    }
}

class multipy : Strategy{
    func operation(num1: Int, num2: Int) -> Int {
        return num1 * num2
    }
}

class Context {
    private var strategy : Strategy? = nil
    func setStrategy(_ str:Strategy){
        self.strategy = str
    }
    func execute(num1:Int , num2:Int)  -> Int{
        return (self.strategy?.operation(num1: num1, num2: num2))!
    }
}

func main(){
    let sumOperation = sum()
    let minusOperation = minus()
    let multipyOperation = multipy()
    let context = Context()
    context.setStrategy(sumOperation)
    print("Result")
    print(context.execute(num1: 1, num2: 3))
    
    context.setStrategy(minusOperation)
    print("Result")
    print(context.execute(num1: 10, num2: 3))
    
    context.setStrategy(multipyOperation)
    print("Result")
    print(context.execute(num1: 10, num2: 3))
}
main()
