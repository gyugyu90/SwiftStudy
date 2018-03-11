//: Playground - noun: a place where people can play

import UIKit

let board = ["CCBDE", "AAADE", "AAABF", "CCBBF"]
let board2 = ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"]
struct Block {
    var character : Character
    var scored : Bool = false
    
    init(character : Character) {
        self.character = character
    }
}

let str = "CCBDE"
let index = str.index(str.startIndex, offsetBy: 1)
let index2 = str.index(index, offsetBy: 1)
str[index..<index2]

fileprivate func convertIntoTwoDimensionalArray(board : [String]) -> [[Block]]{
    var array = [[Block]]()
    for row in board {
        var r = [Block]()
        for char in row {
            r.append(Block(character : char))
        }
        array.append(r)
    }
    return array
}

fileprivate func checkBlocks(array : inout [[Block]], startX : Int, startY : Int) {
    let initialBlock = array[startX][startY]
    let isComposingSquare = initialBlock.character != "0"
        && initialBlock.character == array[startX+1][startY].character
        && initialBlock.character == array[startX][startY+1].character
        && initialBlock.character == array[startX+1][startY+1].character
    if isComposingSquare {
        array[startX][startY].scored = true
        array[startX+1][startY].scored = true
        array[startX][startY+1].scored = true
        array[startX+1][startY+1].scored = true
    }
}

fileprivate func getRoundScoreAndCleanBlocks(array : inout [[Block]]) -> Int{
    var score = 0
    for (x, row) in array.enumerated() {
        for (y, block) in row.enumerated() {
            if block.scored {
                score += 1
                array[x][y] = Block(character: "0")
            }
        }
    }
    return score
}

fileprivate func replaceZeroBlocks(array : inout [[Block]]){
    for (x, row) in array.enumerated() {
        if x == 0 {
            continue
        }
        
        for (y, block) in row.enumerated() {
            if String(block.character) == "0" {
                let object    = array[x][y]
                array[x][y]   = array[x-1][y]
                array[x-1][y] = object
            }
        }
    }
}

fileprivate func debugCharacters(array : [[Block]]) {
    for row in array {
        var string = ""
        for block in row {
            string += String(block.character)
            string += block.scored ? "(T)" : "(F)"
        }
        print(string)
    }
}

fileprivate func calculateScore(m : Int, n : Int, board : [String]) -> Int{
    // 0. 2D로 변환
    var array = convertIntoTwoDimensionalArray(board: board)
    
    var score = 0
    var roundScore = -1
    repeat {
        // 1. 현재 상태의 점수를 구함
        for x in 0..<m-1 {
            for y in 0..<n-1 {
                checkBlocks(array : &array, startX: x, startY: y)
            }
        }
    
        roundScore = getRoundScoreAndCleanBlocks(array: &array)
    
        score += roundScore
        // 2. 상쇄되는 블록을 설정
        replaceZeroBlocks(array: &array)
        
    } while roundScore != 0
    
    // 3. 더 이상 상쇄되는 블록이 없으면 점수 합계 계산
    return score
}

calculateScore(m: 4, n: 5, board: board)
calculateScore(m: 6, n: 6, board: board2)

