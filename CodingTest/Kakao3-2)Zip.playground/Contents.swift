//: Playground - noun: a place where people can play

import UIKit


fileprivate func solution(msg : String) -> [Int]{
    var dictionary = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var _msg = msg
    var resultSet = [Int]()
    while _msg.count > 0 {
        let sortedDic = dictionary.sorted { $0.count > $1.count }
        for w in sortedDic {
            if _msg.starts(with: w), let range = _msg.range(of: w) {
                var nextWordEnd = range.upperBound
                if range.upperBound < _msg.endIndex {
                    nextWordEnd = _msg.index(range.upperBound, offsetBy: 1)
                }
                let nextWord = _msg[_msg.startIndex..<nextWordEnd]
                let remainingString = _msg[range.upperBound..<_msg.endIndex]
                resultSet.append(dictionary.index(of: w)!+1)
                _msg = String(remainingString)
                dictionary.append(String(nextWord))
                break
            }
        }
    }
    return resultSet
}

print(solution(msg: "KAKAO"))
print(solution(msg: "TOBEORNOTTOBEORTOBEORNOT"))
print(solution(msg: "ABABABABABABABAB"))
