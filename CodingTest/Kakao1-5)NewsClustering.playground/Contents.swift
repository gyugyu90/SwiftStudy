//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
fileprivate func jaccardSimilarity(_ str1 : String, _ str2 : String) -> Int{
    // 1. get array of String(two characters)
    let chunk1 = getChunks(from: str1)
    let chunk2 = getChunks(from: str2)
    // 2. 교집합, 합집합 연산
    let intersection = Float(getIntersectionOfArrays(arr1: chunk1, arr2: chunk2).count)
    let union = Float(getUnionOfArrays(arr1: chunk1, arr2: chunk2).count)
    
    if union == 0 {
        return 1 * 65536
    } else {
        return Int(intersection / union * 65536)
    }
    
}

fileprivate func getChunks(from source : String) -> [String] {
    var array = [String]()
    var cache = ""
    for (index, char) in source.enumerated() {
        if index > 0 {
            array.append(String(cache)+String(char))
        }
        cache = String(char)
    }
    
    var alphabetOnly = array.filter { (string) -> Bool in
        return string.range(of: "[a-zA-Z]{2}", options: String.CompareOptions.regularExpression, range: nil, locale: nil) != nil
        }
    for (index, element) in alphabetOnly.enumerated() {
        alphabetOnly[index] = element.lowercased()
    }
    
    return alphabetOnly
}

fileprivate func getIntersectionOfArrays(arr1 : [String], arr2 : [String]) -> [String] {
    var _arr1 = arr1
    var _arr2 = arr2
    
    var intersection = [String]()
    
    for element in arr1 {
        if _arr2.contains(element) {
            intersection.append(element)
            _arr2.remove(at: _arr2.index(of: element)!)
        }
    }
    return intersection
}

fileprivate func getUnionOfArrays(arr1 : [String], arr2 : [String]) -> [String] {
    var union = [String]()
    var intersection = getIntersectionOfArrays(arr1: arr1, arr2: arr2)
    var arr1PlusArr2 = arr1 + arr2
    
    for elem in intersection {
        if arr1PlusArr2.contains(elem) {
            arr1PlusArr2.remove(at: arr1PlusArr2.index(of: elem)!)
        }
    }
    
    return arr1PlusArr2
}

let arr1 = getChunks(from: "FRANCE")
let arr2 = getChunks(from: "french")

let arr3 = getChunks(from: "handshake")
let arr4 = getChunks(from: "shake hands")

getIntersectionOfArrays(arr1: arr1, arr2: arr2)
getIntersectionOfArrays(arr1: arr3, arr2: arr4)

getUnionOfArrays(arr1: arr1, arr2: arr2)
getUnionOfArrays(arr1: arr3, arr2: arr4)

jaccardSimilarity("FRANCE", "french")
jaccardSimilarity("handshake", "shake hands")
jaccardSimilarity("aa1+aa2", "AAAA12")
jaccardSimilarity("E=M*C^2", "e=m*c^2")
