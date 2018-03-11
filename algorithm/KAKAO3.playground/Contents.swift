//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



// 약분하기
func reduceFraction(numerator:Int, denominator:Int) -> (reducedNumerator:Int, reducedDenominator:Int) {
    var x = numerator
    var y = denominator
    while (y != 0) {
        let buffer = y
        y = x % y
        x = buffer
    }
    return(numerator/x, denominator/x)
}

// 최대공약수
func getGCD(_ a : Int, _ b : Int) -> Int {
    var _a = a
    var _b = b
    while _b != 0 {
        (_a, _b) = (_b, _a % _b)
    }
    return abs(_a)
}

// 최소공배수
func getLCM(_ a : Int, _ b : Int) -> Int {
    return (a / getGCD(a, b)) * b
}

//getGCD(2, 3)
//getLCM(2, 3)
//getGCD(12, 15)
//getLCM(12, 15)

let fractionExp = "722/148+360/176"
let fractions = fractionExp.split(separator: "+")
let f0 = fractions[0].split(separator: "/")
let f1 = fractions[1].split(separator: "/")
f0[0] // 분자
f0[1] // 분모

f1[0]
f1[1]

getLCM(148, 176)

let denominator = getLCM(Int(f0[1])!, Int(f1[1])!)
let numerator = Int(f0[0])!*denominator/Int(f0[1])! + Int(f1[0])!*denominator/Int(f1[1])!
reduceFraction(numerator: numerator, denominator: denominator)


func reducedFractionSums(expressions: [String]) -> [String] {
    var resultArray = [String]()
    for fractionExp in expressions {
        let fractions = fractionExp.split(separator: "+")
        let f0 = fractions[0].split(separator: "/")
        let f1 = fractions[1].split(separator: "/")
        f0[0] // 분자
        f0[1] // 분모
        
        f1[0]
        f1[1]
        
        getLCM(148, 176)
        
        let denominator = getLCM(Int(f0[1])!, Int(f1[1])!)
        let numerator = Int(f0[0])!*denominator/Int(f0[1])! + Int(f1[0])!*denominator/Int(f1[1])!
        let result = reduceFraction(numerator: numerator, denominator: denominator)
        resultArray.append("\(result.reducedNumerator)/\(result.reducedDenominator)")
    }
    
    return resultArray
}



reduceFraction(numerator: 722, denominator: 148)

let array = ["722/148+360/176", "978/1212+183/183", "358/472+301/417", "780/309+684/988"]
let resultSet = reducedFractionSums(expressions: array)
for result in resultSet {
    print(result)
}
