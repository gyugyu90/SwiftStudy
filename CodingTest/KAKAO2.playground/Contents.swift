//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let input = "101111010110011011100100"

// 8자리씩으로 잘라서 나눔
func getRGBString(from text: String) -> (String, String, String) {
    var red = ""
    var green = ""
    var blue = ""
    for (index, char) in text.enumerated() {
        if index >= 0 && index < 8 {
            red += String(char)
        } else if index >= 8 && index < 16 {
            green += String(char)
        } else {
            blue += String(char)
        }
    }
    return (red, green, blue)
}

let (r, g, b) = getRGBString(from: input)

// 2진수를 숫자로 바꿔서
//let red = Int(r, radix: 2)!
//let green = Int(g, radix : 2)!
//let blue = Int(b, radix : 2)!

// 다섯가지 색에 대한 공식
func getColorDistance(red : Int, green : Int, blue : Int, comparedTo color: Color) -> Float {
    let r = red - color.red
    let g = green - color.green
    let b = blue - color.blue
    let result = Float(r*r + g*g + b*b).squareRoot()
    return result
}

class Color {
    var red : Int!
    var green : Int!
    var blue : Int!
    var name : String!
    
    init(r : Int, g : Int, b : Int, name : String) {
        self.red = r
        self.green = g
        self.blue = b
        self.name = name
    }
}

class ColorDistance {
    var distance : Float!
    var colorName : String!
    init(distance : Float, colorName : String) {
        self.distance = distance
        self.colorName = colorName
    }
}


let white = Color(r: 255, g: 255, b: 255, name : "White")
//let red2 = Color(r: 255, g: 0, b: 0)
//getColorDistance(red: red, green: green, blue: blue, comparedTo: white)
//getColorDistance(red: red, green: green, blue: blue, comparedTo: red2)

// 가장 작은 숫자를 가져옴

func closestColor(pixels: [String]) -> [String] {
    let whiteColor = Color(r: 255, g: 255, b: 255, name : "White")
    let redColor = Color(r: 255, g: 0, b: 0, name : "Red")
    let blackColor = Color(r: 0, g: 0, b: 0, name : "Black")
    let greenColor = Color(r: 0, g: 255, b: 0, name : "Green")
    let blueColor = Color(r: 0, g: 0, b: 255, name : "Blue")
    let colors : [Color] = [whiteColor, redColor, blackColor, greenColor, blueColor]
    
    return pixels.map { (pixel) -> String in
        let (r, g, b) = getRGBString(from: pixel)
        let red = Int(r, radix: 2)!
        let green = Int(g, radix: 2)!
        let blue = Int(b, radix: 2)!
        let distances = colors.map({ (color) -> ColorDistance in
            let colorDistance = ColorDistance(distance: getColorDistance(red: red, green: green, blue: blue, comparedTo: color), colorName: color.name)
            return colorDistance
        }).sorted(by: { return $0.distance < $1.distance })
        if distances[0].distance == distances[1].distance {
            return "Ambiguous"
        } else {
            return distances[0].colorName
        }
    }
}

fileprivate func debugCD(colorDistances : [ColorDistance]){
    for cd in colorDistances {
        print(cd.distance)
    }
}

closestColor(pixels: ["101111010110011011100100", "110000010101011111101111", "1001101011001111111011101", "010111011010010110000011", "000000001111111111111111"])
