import Cocoa


// Iterator Design Pattern

// Aslında bu pattern foreach döngüsüne     .
//  Bu yapı ıterasyon mantığıyla çalışan bir yapıdır ve aslında içersindeki değelere
// erişime açıktır. IEnumrable sınıfını inherit edeerek çalışmaktadır.

// Bir veri kümesinin uygulama ile bağlantısıını (gerekli olmayan) en aza indirgemek için kullanılır.

// İşlemdeki nesneler ile iterasyon içersindeki kurallar bu pattern içersinde gerçekleşir.
class Person {
    var name:String
    var surname:String
    var age :Int
    init(n:String , s:String,a:Int) {
        self.name = n
        self.surname = s
        self.age = a
    }
}
protocol PersonIterator {
    func next() ->Person?
    func currentPerson() ->Person?
    func isFinish() ->Bool
    func size()->Int
}
protocol PersonAggregate {
    func getIterator() -> PersonIterator
    func getPersonByIndex(_ index:Int)->Person
}
class PersonIter : PersonIterator{
    private var list : HomePerson?
    var index:Int = 0
    init(_ list : HomePerson) {
        self.list = list
    }
    func next() -> Person? {
        index = index + 1
        return isFinish() ? list?.getPersonByIndex(index) : nil
    }
    
    func currentPerson() -> Person? {
        return list?.getPersonByIndex(index)
    }
    
    func isFinish() -> Bool {
        return index < self.size()
    }
    
    func size() -> Int {
        return list?.count ?? 0
    }
}
class HomePerson: PersonAggregate {
    private var list:[Person] = []
    var count : Int {
        return list.count
    }
    func add(_ person:Person){
        list.append(person)
    }
    func pop(){
        list.removeLast()
    }
    func getIterator() -> PersonIterator {
        return PersonIter(self)
    }
    func getPersonByIndex(_ index: Int) -> Person {
       return list[index]
    }
}

let persons = HomePerson()
persons.add(Person(n: "Hasan Özgür", s: "Elmaslı", a: 23))
persons.add(Person(n: "İsim", s: "Soyisim", a: 23))
persons.add(Person(n: "Name", s: "Surname", a: 23))
persons.add(Person(n: "Person", s: "Person2", a: 23))

let iter = persons.getIterator()

while iter.isFinish() {
    print(iter.currentPerson()?.name as Any)
    iter.next()
}

