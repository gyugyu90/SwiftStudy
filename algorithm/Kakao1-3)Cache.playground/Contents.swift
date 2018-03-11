//: Playground - noun: a place where people can play

import UIKit

fileprivate func validateInput(cacheSize : Int, cities : [String]){
    guard cacheSize >= 0 && cacheSize <= 30 else {
        fatalError("cacheSize is out of the boundary")
    }
    guard cities.count <= 100000 else {
        fatalError("too many cities")
    }
    guard !cities.isEmpty else {
        fatalError("no cities")
    }
}

fileprivate func getProcessTime(size : Int, cityArray : [String]) -> Int{
    var cacheArray = [String]()
    var time = 0
    for city in cityArray {
        
        let contains = cacheArray.contains(where: { (cache) -> Bool in
            return cache.caseInsensitiveCompare(city) == .orderedSame
        })
        
        if contains {
            time += 1
        }else {
            time += 5
        }
        
        guard size > 0 else {
            continue
        }
        
        if cacheArray.count < size {
            cacheArray.append(city)
        } else {
            cacheArray.removeFirst()
            cacheArray.append(city)
        }
    }
    return time
}


let cacheSize1 = 3
let cities1 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]
getProcessTime(size: cacheSize1, cityArray: cities1)

let cacheSize2 = 3
let cities2 = ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]
getProcessTime(size: cacheSize2, cityArray: cities2)

let cacheSize3 = 2
let cities3 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]
getProcessTime(size: cacheSize3, cityArray: cities3)

let cacheSize4 = 5
let cities4 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]
getProcessTime(size: cacheSize4, cityArray: cities4)

let cacheSize5 = 6
let cities5 = ["Jeju", "Pangyo", "NewYork", "newyork"]
getProcessTime(size: cacheSize5, cityArray: cities5)

let cacheSize6 = 0
let cities6 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA"]
getProcessTime(size: cacheSize6, cityArray: cities6)
