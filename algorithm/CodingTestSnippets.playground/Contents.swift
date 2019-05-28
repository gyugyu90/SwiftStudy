//: Playground - noun: a place where people can play

import UIKit

// Math!!  ====================================================================
// 제곱구하기
let _ = Int(truncating: NSDecimalNumber(decimal: pow(2, 5)))

// 이진수 교집합
12 & 15
// 이진수 합집합
12 | 15

// n진수 구하기
String(11, radix : 4)


// String!! ====================================================================
// REGEX : 정규식에 들어맞는 문자열을 배열로 만들기
func findMatches(pattern : String, in text : String) -> [String] {
    do {
        let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        return regex.matches(in: text, range: NSRange(text.startIndex..., in: text)).map({ (result) -> String in
            String(text[Range(result.range, in:text)!])
        })
    } catch let error {
        print("error occurred while parsing regex : \(error.localizedDescription)")
        return []
    }
}

// 정규식에 맞는지 isMatching!
let str0 = "3aa"
let str2 = "aaa"
let regex = try! NSRegularExpression(pattern: "[0-9]", options:.caseInsensitive)
regex.firstMatch(in: str0, options: [], range: NSMakeRange(0, str0.utf16.count)) != nil
regex.firstMatch(in: str2, options: [], range: NSMakeRange(0, str2.utf16.count)) != nil

// 문자열 비교 caseinsensitive.. lowercase uppercase도 있음
"Aa".caseInsensitiveCompare("aa") == .orderedSame
"Aa".lowercased() == "aa".lowercased()

// String에서 substring의 range
let str1 = "HELLO WORLD"
if let range = str1.range(of: "ELL") {
    str1[str1.startIndex..<range.lowerBound]
    str1[str1.startIndex..<range.upperBound]
    str1[range.upperBound..<str1.endIndex]
}



// Date!!  ====================================================================
fileprivate func getTimeDifference(start : String, end : String) -> Int {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    let startTime = dateFormatter.date(from: start)!
    let endTime = dateFormatter.date(from: end)!
    let calendar = Calendar.current
    // choose minute second or whatever
    let elapsed = calendar.dateComponents(Set<Calendar.Component>([.minute]), from: startTime, to: endTime)
    return elapsed.minute!
}

// String => Date 변환 + Calendar를 이용해서 add minutes
fileprivate func plusTime(_ time : String, minute : Int) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    let date = formatter.date(from: time)!
    let calendar = Calendar.current
    let minuteAdded = calendar.date(byAdding: .minute, value: minute, to: date)!
    return formatter.string(from: minuteAdded)
}

// 자료구조!! ====================================================================
// 배열의 교집합 구하기
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

// 배열의 합집합 구하기
fileprivate func getUnionOfArrays(arr1 : [String], arr2 : [String]) -> [String] {
    let intersection = getIntersectionOfArrays(arr1: arr1, arr2: arr2)
    var arr1PlusArr2 = arr1 + arr2
    
    for elem in intersection {
        if arr1PlusArr2.contains(elem) {
            arr1PlusArr2.remove(at: arr1PlusArr2.firstIndex(of: elem)!)
        }
    }
    
    return arr1PlusArr2
}




// 정렬!! ====================================================================
var arr = [1,2,3,4,5,6,7,8,9]
// 역정렬
arr.sorted { (e1, e2) -> Bool in
    return true
}
arr.reversed()
// 그대로 .. 안정정렬(stable sort)??
arr.sorted { (e1, e2) -> Bool in
    return false
}

round(0.6) // 1

let text = "abcdefghijklmn"
let start = 3
let length = 7
text[text.index(text.startIndex, offsetBy: start)..<text.index(text.startIndex, offsetBy: start+length)] // defghij

