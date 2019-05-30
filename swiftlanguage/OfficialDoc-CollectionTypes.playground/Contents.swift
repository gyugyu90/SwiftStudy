import UIKit

var str = "Hello, playground"
func creatingArray() {
    var someInts = [Int]()
    print("someInts is of type [Int] with \(someInts.count) items")
    
    someInts.append(3) // contains one value
    someInts = [] // empty array
    
    var threeDoubles = Array(repeating: 0.0, count: 3)
    
    var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
    
    var sixDoubles = threeDoubles + anotherThreeDoubles
    
    debugPrint(sixDoubles)
}

//creatingArray()

func accessingAndModifyingArray() {
    var shoppingList: [String] = ["Eggs", "Milk"]
    
    print("The shopping list contains \(shoppingList.count) items")
    
    if shoppingList.isEmpty {
        print("The shopping list is empty")
    } else {
        print("The shopping list is not empty")
    }
    
    shoppingList.append("Flour")
    
    shoppingList += ["Baking Powder"]
    shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
    
    debugPrint(shoppingList)
    
    var firstItem = shoppingList[0]
    print(firstItem)
    
    shoppingList[0] = "Six eggs"
    
    shoppingList[4...6] = ["Bananas", "Apples"]
    
    shoppingList.insert("Maple Syrup", at: 0)
    
    debugPrint(shoppingList)
    
    let mapleSyrup = shoppingList.remove(at: 0)
    
    print("removed mapleSyrup===")
    debugPrint(shoppingList)
    
    firstItem = shoppingList[0]
    print("Six eggs?: ", firstItem)
    
    let apples = shoppingList.removeLast()
    
    print("ITERATION")
    for item in shoppingList {
        print(item)
    }
    
    print("ENUMERATION")
    for (index, value) in shoppingList.enumerated() {
        print("Item \(index + 1): \(value)")
    }
    
}

//accessingAndModifyingArray()

func setBasic() {
    var letters = Set<Character>()
    print("letters is of type Set<Character> with \(letters.count) items.")
    
    letters.insert("a")
    print(letters)
    
    letters = []
    print(letters)
    
    var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
    print("I have \(favoriteGenres.count) favorite music genres")
    
    if favoriteGenres.isEmpty {
        print("As far as music goes, I'm not picky.")
    } else {
        print("I have particular music preferences.")
    }
    
    favoriteGenres.insert("Jazz")
    
    if let removedGenre = favoriteGenres.remove("Rock") {
        print("\(removedGenre)? I'm over it.")
    } else {
        print("I never much cared for that")
    }
    
    if favoriteGenres.contains("Funk") {
        print("I get up on the good foot.")
    } else {
        print("It's too funky in here.")
    }
    
    
    for genre in favoriteGenres {
        print(genre)
    }
}

//setBasic()

func setOperations(){
    let oddDigits : Set = [1, 3, 5, 7, 9]
    let evenDigits : Set = [0, 2, 4, 6, 8]
    let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
    
    print(oddDigits.union(evenDigits).sorted())
    print(oddDigits.intersection(evenDigits).sorted())
    print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())
    print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())
    
    let houseAnimals: Set = ["🐶", "🐱"]
    let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
    let cityAnimals: Set = ["🐦", "🐭"]
    print(houseAnimals.isSubset(of: farmAnimals))
    print(farmAnimals.isSuperset(of: houseAnimals))
    print(farmAnimals.isDisjoint(with: cityAnimals))
    
}

//setOperations()

func dictionaryBasic() {
    var namesOfIntegers = [Int: String]()
    namesOfIntegers[16] = "Sixteen"
    namesOfIntegers = [:]
    
    var airports: [String: String] = ["YYZ":"Toronto Pearson", "DUB":"Dublin"]
    print("The airports dictionary contains \(airports.count) items")
    
    if airports.isEmpty {
        print("The airports dictionary is empty.")
    } else {
        print("The airports dictionary is not empty.")
    }
    
    airports["LHR"] = "London"
    airports["LHR"] = "London Heathrow"
    print(airports)
    
    if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
        print("the old value for DUB was \(oldValue)")
    }
    
    if let airportName = airports["DUB"] {
        print("The name of the airport is \(airportName).")
    } else {
        print("That airport is not in the airports dictionary.")
    }
    
    airports["APL"] = "Apple International"
    airports["APL"] = nil
    
    for (airportCode, airportName) in airports {
        print("\(airportCode): \(airportName)")
    }
    
    for airportCode in airports.keys {
        print("Airport code: \(airportCode)")
    }
    
    for airportName in airports.values {
        print("Airport name: \(airportName)")
    }
    
    let airportCodes = [String](airports.keys)
    print(airportCodes)
    
    let airportNames = [String](airports.values)
    print(airportNames)
    
}

dictionaryBasic()
// Set의 값과 Dictionary의 Key는 Hashable protocol을 conform해야 한다.

