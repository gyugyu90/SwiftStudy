//: Playground - noun: a place where people can play

import UIKit

let words1 = ["go","gone","guild"]
let words2 = ["abc","def","ghi","jklm"]
let words3 = ["word","war","warrior","world"]

fileprivate func matchingWordCount(subject : String, from words: [String]) -> Int{
    return words.filter { (word) -> Bool in
        return word.contains(subject)
        }.count
}

fileprivate func solution(words : [String]) -> Int{
    var resultArray = [Int]()
    for word in words {
        var charStack = ""
        for char in word {
            charStack += String(char)
            let matchingWordCnt = matchingWordCount(subject: charStack, from: words)
            if matchingWordCnt == 1 || charStack.count == word.count {
                print(charStack)
                resultArray.append(charStack.count)
                break
            }
        }
    }
    return resultArray.reduce(0, +)
}

solution(words: words1)
solution(words: words2)
solution(words: words3)
