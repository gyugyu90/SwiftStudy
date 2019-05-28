import UIKit

var str = "Hello, playground"

protocol Person {
    var name : String { get }
    var age : Int { get }
    
    func getAge() -> Int
}

// 프로토콜 초기 구현
extension Person {
    func getAge() -> Int{
        return self.age
    }
}

struct FireFighter: Person {
    var name : String
    var age: Int
    
    func extinguish() {
        
    }
}

struct Criminal: Person {
    var name: String
    var age : Int
    var didSomethingBad = true
}

struct PoliceMan: Person {
    var name: String
    var age: Int
    
    var jail: [Criminal] = []
    
    // 구조체 내부에서 데이터를 수정할 때는 mutating keyword를 써야 함
    mutating func arrest(criminal: Criminal) {
        jail.append(criminal)
    }
}


// => Person 프로토콜을 준수하는 구조체가 getAge()를 따로 구현하지 않아도 사용할 수 있다.
//    getAge() 는 재정의해서 사용할 수 있다.


protocol Box {
    // 연관값으로 선언
    associatedtype Item
    
    var items: [Item] {get set}
    mutating func addItem(item: Item)
}

extension Box {
    mutating func addItem(item: Item) {
        items.append(item)
    }
}

// 제네릭으로 선언
struct StructBox<Element>: Box {
    typealias Item = Element
    
    var items: [Element]
}

let intBox: StructBox<Int> = StructBox(items: [0, 1])
let stringBox: StructBox<String> = StructBox(items: ["Lorem", "Ipsum"])


protocol Printable {
    func printSelf()
}

// where로 Self가 Box 프로토콜을 따르는 경우에만 초기 구현이 되도록 제약
extension Printable where Self: Box {
    func printSelf() {
        print(items)
    }
}

extension StructBox: Printable {
    
}

// StructBox는 Box 프로토콜을 따르므로 초기 구현된 것을 바로 사용 가능.
stringBox.printSelf()

protocol Car {
    func drive()
}

struct Sedan : Car {
    let brand : String
    
    func drive() {
        print("drive")
    }
}

// Struct로
let sedan1: Sedan = Sedan(brand: "BMW")
sedan1.brand

// Protocol로
let sedan2: Car = Sedan(brand: "Audi")
// sedan2.brand => 접근 불가

// POP는
// 1) 필요한 부분만 프로토콜로 분리해서 만들 수 있고
// 2) 다중 프로토콜을 구현할 수 있다.
// 3) 게다가 프로토콜 규칙을 class, structure, 그리고 enumeration에 적용할 수 있기 때문에 확장 부분에서도 OOP보다 유연하다.

