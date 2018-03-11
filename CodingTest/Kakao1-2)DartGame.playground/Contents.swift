//: Playground - noun: a place where people can play

import UIKit

let str = "1S2D*3T"

let str2 = "1D2S#10S"

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

findMatches(pattern: "[0-9]+[SDT][*#]?", in: str)
findMatches(pattern: "[0-9]+[SDT][*#]?", in: str2)


func getScore(from text : String) -> Int{
    var scores = [Int]()
    for (index, result) in findMatches(pattern: "[0-9]+[SDT][*#]?", in: text).enumerated() {
        var score = 0
        if let digit = findMatches(pattern: "[0-9]+", in: result).first {
            score = Int(digit)!
        }
        if let bonus = findMatches(pattern: "[SDT]", in: result).first {
            if bonus == "D" {
                score = score * score
            } else if bonus == "T" {
                score = score * score * score
            }
        }
        if let option = findMatches(pattern: "[*#]", in: result).first {
            if option == "*" {
                score = score * 2
                if index > 0 {
                    scores[index-1] = scores[index-1] * 2
                }
            } else {
                score = score * (-1)
            }
        }
        scores.append(score)
    }
    return scores.reduce(0, +)
}


getScore(from: "1S2D*3T")
getScore(from: "1D2S#10S")
getScore(from: "1D2S0T")
getScore(from: "1S*2T*3S")
getScore(from: "1D#2S*3S")
getScore(from: "1T2D3D#")
getScore(from: "1D2S3T*")


