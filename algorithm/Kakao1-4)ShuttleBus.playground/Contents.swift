//: Playground - noun: a place where people can play

import UIKit

let timetable = ["08:00", "08:01", "08:02", "08:03"]
let timetable2 = ["09:10", "09:09", "08:00"]
let timetable3 = ["09:00", "09:00", "09:00", "09:00"]
let timetable4 = ["00:01", "00:01", "00:01", "00:01", "00:01"]
let timetable5 = ["23:59","23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59"]

fileprivate func getSortedTimeTable(_ timetable : [String]) -> [String] {
    return timetable.sorted { (e1, e2) -> Bool in
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.date(from: e1)! < formatter.date(from: e2)!
    }
}

fileprivate func plusTime(_ time : String, minute : Int) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    let date = formatter.date(from: time)!
    let calendar = Calendar.current
    let minuteAdded = calendar.date(byAdding: .minute, value: minute, to: date)!
    return formatter.string(from: minuteAdded)
}

fileprivate func arrivedEarlier(_ time : String, than time2: String) -> Bool{
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter.date(from: time)! <= formatter.date(from: time2)!
}

// test
//plusTime("09:00", minute: 15)
//plusTime("09:00", minute: 70)
//plusTime("23:00", minute: 70)

fileprivate func getTheVeryLastMinute(n : Int, t : Int, m : Int, timetable : [String]) -> String{
    var sorted = getSortedTimeTable(timetable)
    var _n = n
    var time = "09:00"
    for _ in 0..<n {
        if _n == 1 {
            if sorted.count >= m {
                if arrivedEarlier(plusTime(sorted[m-1], minute: -1), than:time) {
                    return plusTime(sorted[m-1], minute:-1)
                }else {
                    return time
                }
            } else {
                return time
            }
        }
        
        for _ in 0..<m {
            guard sorted.isEmpty == false else {
                continue
            }
            if let first = sorted.first, arrivedEarlier(first, than: time) {
                sorted.removeFirst()
            }
        }
        
        // prepare for next bus
        _n -= 1
        time = plusTime(time, minute: t)
    }
    return ""
}

getTheVeryLastMinute(n: 1, t: 1, m: 5, timetable: timetable)
getTheVeryLastMinute(n: 2, t: 10, m: 2, timetable: timetable2)
getTheVeryLastMinute(n: 2, t: 1, m: 2, timetable: timetable3)
getTheVeryLastMinute(n: 1, t: 1, m: 5, timetable: timetable4)
getTheVeryLastMinute(n: 1, t: 1, m: 1, timetable: ["23:59"])
getTheVeryLastMinute(n: 10, t: 60, m: 45, timetable: timetable5)

