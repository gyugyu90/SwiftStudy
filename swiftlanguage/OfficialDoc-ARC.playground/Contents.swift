import UIKit

var str = "Hello, playground"

/* ARC In Action */
class Person {
    let name: String
    init(name : String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

func arcInAction() {
    var reference1: Person?
    var reference2: Person?
    var reference3: Person?
    
    reference1 = Person(name: "John Appleseed") // makes a strong reference
    reference2 = reference1
    reference3 = reference1
    
    reference1 = nil
    reference2 = nil
    reference3 = nil // 이 시점에서 deinitialized
}

// arcInAction()

/* Strong Reference Cycles Between Class Instances */
class Person2 {
    let name: String
    init(name : String) {
        self.name = name
    }
    var apartment : Apartment?
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment {
    let unit : String
    init(unit : String) {
        self.unit = unit
    }
    var tenant: Person2?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

func strongReferenceCycle() {
    var john : Person2?
    var unit4A: Apartment?
    
    john = Person2(name: "John Doe")
    unit4A = Apartment(unit: "4A")
    
    john!.apartment = unit4A
    unit4A!.tenant = john // strong reference cycle is made
    
    john = nil
    unit4A = nil // deallocation never called
}

// strongReferenceCycle()

/* Resolving Strong Reference Cycles Between Class Instances */
// With "weak" keyword
class Person3 {
    let name: String
    init(name : String) {
        self.name = name
    }
    var apartment : Apartment2?
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment2 {
    let unit : String
    init(unit : String) {
        self.unit = unit
    }
    weak var tenant: Person3?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

func resolvingWithWeak() {
    var sam: Person3?
    var unit5A: Apartment2?
    
    sam = Person3(name: "Sam Smith")
    unit5A = Apartment2(unit: "5A")
    
    sam!.apartment = unit5A
    unit5A!.tenant = sam
    
    sam = nil // deallocation success
    unit5A = nil
}

// resolvingWithWeak()

// With "unowned" keyword
class Customer {
    let name : String
    var card: CreditCard?
    
    init(name : String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitailized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

func resolvingWithUnowned() {
    var bob : Customer?
    bob = Customer(name: "Bob Marley")
    bob!.card = CreditCard(number: 1234_5678_9012_3456, customer: bob!)
    bob = nil
}

// resolvingWithUnowned()

class Country {
    let name : String
    var capitalCity : City! // 1) !가 꼭 있기 때문에
    
    init(name : String, capitalName: String) {
        self.name = name // 2) 이 시점에서 fully initialized 되었기 때문에 self에 접근 가능..
        self.capitalCity = City(name: capitalName, country: self) // => 만약 self.name = name 과 순서를 바꾸면 컴파일 되지 않음
    }
}

class City {
    let name : String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

func unwrappedOptionalProperties() {
    var country = Country(name: "Canada", capitalName: "Ottawa")
    print("\(country.name)'s capital city is called \(country.capitalCity.name)")
}

//unwrappedOptionalProperties()

class HTMLElement {
    let name : String
    let text : String?
    
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    lazy var asHTML2: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    
    init(name : String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

func strongReferenceForClosures() {
    let heading = HTMLElement(name: "h1")
    let defaultText = "some default text"
    
    heading.asHTML = {
        return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
    }
    
    print(heading.asHTML())
    
    var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
    print(paragraph!.asHTML())
    
    paragraph = nil
}

// strongReferenceForClosures()

func resolvingStrongReferencesForClosures() {
    var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
    print(paragraph!.asHTML2())
    
    paragraph = nil
}

resolvingStrongReferencesForClosures()
