//: Playground - noun: a place where people can play

import UIKit

func solution(n : Int, t : Int, m : Int, p : Int) -> String {
    var resultSet = [String]()
    var number = 0
    var result = ""
    while(resultSet.count < t*m) {
        var result = String(number, radix : n)
        result.forEach { (char) in
            resultSet.append(String(char).uppercased())
        }
        number += 1
    }
    
    for num in 1...t*m {
        if num % m == p || m == p && num % m == 0 {
            result += resultSet[num-1]
        }
    }
    return result
}

solution(n: 2, t: 4, m: 2, p: 1)
solution(n: 16, t: 16, m: 2, p: 1)
solution(n: 16, t: 16, m: 2, p: 2)
