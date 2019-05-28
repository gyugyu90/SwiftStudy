//: Playground - noun: a place where people can play

import UIKit




let str1 = "abc"
let str2 = "cde"

let characters1 = str1.map{$0}
let characters2 = str2.map{$0}

fileprivate func getIntersection(arr1 : [Character], arr2 : [Character]) -> [Character] {
    var _arr2 = arr2
    
    var resultArray = [Character]()
    for elem in arr1 {
        if _arr2.contains(elem) {
            resultArray.append(elem)
            _arr2.remove(at: _arr2.firstIndex(of: elem)!)
        }
    }
    return resultArray
}

let count = getIntersection(arr1: characters1, arr2: characters2).count
//print(characters1.count-count + characters2.count-count)



let str3 = "ifailuhkqq"
let str4 = "pvmupwjjjf"
let str5 = "hucpoltgty"
let str6 = "iwwhrlkpek"

func getAnagramCount(from text : String) -> Int{
    var resultArray = [Int]()
    for length in 1..<text.count {
        var chunks = [String]()
        for startingIndex in 0...text.count {
            if startingIndex + length <= text.count {
                let chunk = text[text.index(text.startIndex, offsetBy: startingIndex)..<text.index(text.startIndex, offsetBy: startingIndex+length)]
                chunks.append(String(chunk))
            }
        }
        let sortedArray = chunks.map{String($0.sorted())}
        
        var resultCount = 0
        for (i, e) in sortedArray.enumerated() {
            for j in i+1..<sortedArray.count {
                if e == sortedArray[j] {
                    resultCount += 1
                }
            }
        }
        resultArray.append(resultCount)
    }
    return resultArray.reduce(0, +)
}

getAnagramCount(from: str3)
getAnagramCount(from: str4)

