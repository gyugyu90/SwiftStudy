//: Playground - noun: a place where people can play

import UIKit

let n = 5
let arr1 = [9, 20, 28, 18, 11]
let arr2 = [30, 1, 21, 17, 28]

var resultArray = [String]()

fileprivate func validateInput(size : Int, arr1 : [Int], arr2 : [Int]){
    if size < 1 {
        fatalError("size of array is too small")
    } else if size > 16 {
        fatalError("size of array is too big")
    }
    
    guard size == arr1.count && size == arr2.count else {
        fatalError("size does not match with the array size")
    }
}


fileprivate func parseInt2String(number : Int, source : Int) -> String{
    var num = number
    var s = source
    var resultString = ""
    while num > 0 {
        let powerNumber = Int(NSDecimalNumber(decimal: pow(2, num-1)))
        if s >= powerNumber {
            s = s - powerNumber
            resultString += "#"
        } else {
            resultString += " "
        }
        num -= 1
    }
    return resultString
}

for (e1, e2) in zip(arr1, arr2) {
    resultArray.append(parseInt2String(number: n, source: e1|e2))
}

validateInput(size: n, arr1: arr1, arr2: arr2)
print(resultArray)

let m = 6
let arr3 = [46, 33, 33 ,22, 31, 50]
let arr4 = [27 ,56, 19, 14, 14, 10]




var resultArray2 = [String]()

for (e1, e2) in zip(arr3, arr4) {
    resultArray2.append(parseInt2String(number: m, source: e1|e2))
}

validateInput(size: m, arr1: arr3, arr2: arr4)
print(resultArray2)

12&15

