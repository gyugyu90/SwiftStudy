//: Playground - noun: a place where people can play

import UIKit

let str = "MUZI01.zip"
let str2 = "foo010bar020.zip"
let str3 = "F-15"
fileprivate func getHead(str : String) -> String{
    var head = ""
    for char in str {
        // memo if matches regex!
        let regex = try! NSRegularExpression(pattern: "[a-z .-]", options:.caseInsensitive)
        if regex.firstMatch(in: String(char), options: [], range: NSMakeRange(0, String(char).utf16.count)) == nil {
            break
        }
        head += String(char)
    }
    return head
}

fileprivate func getNumber(str : String) -> String {
    var number = ""
    var flag = false
    for char in str {
        // memo if matches regex!
        let regex = try! NSRegularExpression(pattern: "[0-9]", options:.caseInsensitive)
        let isMatching = regex.firstMatch(in: String(char), options: [], range: NSMakeRange(0, String(char).utf16.count)) != nil
        if isMatching {
            flag = true
        }
        if flag, !isMatching {
            break
        }
        
        if flag, isMatching {
            number += String(char)
        }
        
    }
    return number
}

fileprivate func getTail(str : String) -> String {
    var tail = ""
    var flagNumberStarted = false
    var flagNumberEnded = false
    for char in str {
        // memo if matches regex!
        let regex = try! NSRegularExpression(pattern: "[0-9]", options:.caseInsensitive)
        let isMatching = regex.firstMatch(in: String(char), options: [], range: NSMakeRange(0, String(char).utf16.count)) != nil
        if isMatching {
            flagNumberStarted = true
        }
        
        if flagNumberStarted, !isMatching {
            flagNumberEnded = true
        }
        
        if flagNumberStarted, flagNumberEnded {
            tail += String(char)
        }
        
    }
    return tail
}

//getHead(str: str)
//getNumber(str: str)
//getTail(str: str)
//
//getHead(str: str2)
//getNumber(str: str2)
//getTail(str: str2)
//
//getHead(str: str3)
//getNumber(str: str3)
//getTail(str: str3)

let files1 = ["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"]
let files2 = ["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"]
fileprivate func solution(files : [String]) -> [String]{
    return files.sorted { (f1, f2) -> Bool in
        let head1 = getHead(str: f1.lowercased())
        let head2 = getHead(str: f2.lowercased())
        if head1 == head2 {
            let number1 = Int(getNumber(str: f1))!
            let number2 = Int(getNumber(str: f2))!
            if number1 != number2 {
                return number1 < number2
            }
        }else {
            return head1 < head2
        }
        return false // remain original order
    }
}

print(solution(files: files1))
print(solution(files: files2))

