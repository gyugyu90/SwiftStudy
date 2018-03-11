//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



let arr = [1,2,3] // "3 2 1" 만들기
arr.reversed().reduce("") {
    return $0+"\($1) "
}.trimmingCharacters(in: .whitespacesAndNewlines)



let _2Darray = [[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6]]
fileprivate func getHourglassSum(arr : [[Int]], i : Int, j : Int) -> Int{
    var result = 0
    result += arr[i-1][j-1]
    result += arr[i-1][j]
    result += arr[i-1][j+1]
    result += arr[i][j]
    result += arr[i+1][j-1]
    result += arr[i+1][j]
    result += arr[i+1][j+1]
    // var result = arr[i-1][j-1] + arr[i-1][j] + arr[i-1][j+1] + arr[i][j] + arr[i+1][j-1] + arr[i+1][j] + arr[i+1][j+1]
    // 이렇게 긴 수식은 infer를 하기에 너무 오래 걸리므로 expression was too long이라는 오류가 발생함
    return result
}

var resultArray = [Int]()
for i in 1...4 {
    for j in 1...4 {
        resultArray.append(getHourglassSum(arr:_2Darray, i:i, j:j))
    }
}
print(resultArray.sorted().last!)
