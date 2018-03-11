//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let array = [41, 34, 6, 16, 38, 36, 28, 19, 45, 43, 49]

func bubbleSort(array : [Int]) -> [Int]{
    var _array = array
    for loop_count in stride(from: _array.count-1, through: 0, by: -1) {
        for idx in 0..<loop_count {
            if _array[idx] > _array[idx+1] {
                let buffer = _array[idx]
                _array[idx] = _array[idx+1]
                _array[idx+1] = buffer
            }
        }
    }
    return _array
}
//bubbleSort(array: array) // 18 times, O(n^2)

func selectionSort(array : [Int]) -> [Int] {
    var _array = array
    for loop_count in stride(from: _array.count-1, through: 0, by: -1) {
        var biggestNumberIndex = 0
        for idx in 0...loop_count {
            if _array[biggestNumberIndex] < _array[idx] {
                biggestNumberIndex = idx
            }
        }
        var buffer = _array[loop_count]
        _array[loop_count] = _array[biggestNumberIndex]
        _array[biggestNumberIndex] = buffer
    }
    return _array
}
//selectionSort(array: array) // 11 times, O(n^2)

func insertionSort(array : [Int]) -> [Int] {
    var _array = array
    
    for index in 1..<_array.count {
        var currentValue = _array[index]
        var position = index
        while position > 0 && _array[position-1] > currentValue {
            _array[position] = _array[position-1]
            position -= 1
        }
        _array[position] = currentValue
    }
    
    return _array
}
//insertionSort(array: array) // O(n^2)

func mergeSort(array : [Int]) -> [Int] {
    var _array = array
    if _array.count <= 1{
        return _array
    }
    
    var mid = _array.count / 2
    var leftList = _array[0..<mid]
    var rightList = _array[mid..<_array.count]
    
    var L = mergeSort(array: Array(leftList))
    var R = mergeSort(array: Array(rightList))
    
    var i = 0
    var j = 0
    var result = [Int]()
    
    while i < L.count && j < R.count {
        if L[i] < R[j] {
            result.append(L[i])
            i += 1
        } else {
            result.append(R[j])
            j += 1
        }
    }
    
    result.append(contentsOf: Array(L[i..<L.count]))
    result.append(contentsOf: Array(R[j..<R.count]))
    return result
}

//mergeSort(array: array)

func quicksort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }
    
    let pivot = a[a.count/2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    
    return quicksort(less) + equal + quicksort(greater)
}



