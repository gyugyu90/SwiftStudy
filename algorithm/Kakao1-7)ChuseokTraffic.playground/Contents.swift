//: Playground - noun: a place where people can play

import UIKit

let lines = ["2016-09-15 01:00:04.001 2.0s", "2016-09-15 01:00:07.000 2s" ]
let lines2 = [ "2016-09-15 01:00:04.002 2.0s", "2016-09-15 01:00:07.000 2s" ]
let lines3 = [ "2016-09-15 20:59:57.421 0.351s", "2016-09-15 20:59:58.233 1.181s", "2016-09-15 20:59:58.299 0.8s", "2016-09-15 20:59:58.688 1.041s", "2016-09-15 20:59:59.591 1.412s", "2016-09-15 21:00:00.464 1.466s", "2016-09-15 21:00:00.741 1.581s", "2016-09-15 21:00:00.748 2.31s", "2016-09-15 21:00:00.966 0.381s", "2016-09-15 21:00:02.066 2.62s" ]
let f = DateFormatter()
f.dateFormat = "HH:mm:ss.SSS"
f.timeZone = TimeZone(abbreviation: "UTC")
fileprivate func splitLog(source log : String) -> [String]{
    return log.split(separator: " ").map{String($0)}
}

let formatter = DateFormatter()
formatter.dateFormat = "HH:mm:ss.SSS"
formatter.timeZone = TimeZone(abbreviation: "UTC")

fileprivate func getStartAndCompletedTime(completedString : String, timespanString : String) -> (Date, Date){
    let completed = formatter.date(from: completedString)!
    let timespan = timespanString.replacingOccurrences(of: "s", with: "")
    let started = completed.addingTimeInterval(TimeInterval((-1)*Float(timespan)!+0.001))
    return (started, completed)
}

fileprivate func getCompletedTimeAndSecondLater(completedString : String, timespanString : String) -> (Date, Date){
    
    let completed = formatter.date(from: completedString)!
    let secondLater = completed.addingTimeInterval(0.999+0.000001)
    return (completed, secondLater)
}

fileprivate func getCompletedTimeAndSecondLater(startedString : String, timespanString : String) -> (Date, Date){
    
    let started = formatter.date(from: startedString)!
    let secondEarlier = started.addingTimeInterval(-0.999-0.000001)
    return (secondEarlier, started)
}

fileprivate func checkWasInBetween(objStart : Date, objEnd : Date, from : Date, to : Date) -> Bool {
    
    print(f.string(from: from), f.string(from: to))
    print(f.string(from: objStart), f.string(from: objEnd))
    if from <= objEnd && objEnd <= to {
        return true
    } else if from <= objStart && objStart <= to {
        return true
    } else if objStart <= from && to <= objEnd {
        return true
    }
    return false
}

//let logs = splitLog(source: logArray[0])
//let (start, end) = getStartAndCompletedTime(completedString: logs[1], timespanString: logs[2])
var result = 0
for subject in lines3 {
    let splitSubjectLogs = splitLog(source: subject)
    let (completed, secondLater) = getCompletedTimeAndSecondLater(completedString: splitSubjectLogs[1], timespanString: splitSubjectLogs[2])
    var round = 0
    
    for object in lines3 {
        let splitObjectLogs = splitLog(source: object)
        let (start, end) = getStartAndCompletedTime(completedString: splitObjectLogs[1], timespanString: splitObjectLogs[2])
        if checkWasInBetween(objStart: start, objEnd: end, from: completed, to: secondLater) {
            print("in between")
            round += 1
        }
    }
    if round > result {
        result = round
    }
    print("===========")
}

print(result)

var result2 = 0
for subject in lines3 {
    let splitSubjectLogs = splitLog(source: subject)
    let (secondEarlier, startedTime) = getCompletedTimeAndSecondLater(startedString: splitSubjectLogs[1], timespanString: splitSubjectLogs[2])
    var round = 0
    
    for object in lines3 {
        let splitObjectLogs = splitLog(source: object)
        let (start, end) = getStartAndCompletedTime(completedString: splitObjectLogs[1], timespanString: splitObjectLogs[2])
        if checkWasInBetween(objStart: start, objEnd: end, from: secondEarlier, to: startedTime) {
            print("in between")
            round += 1
        }
    }
    if round > result2 {
        result2 = round
    }
    print("===========")
}

print(result2)

// ANSWER
if result > result2 {
    print(result)
}else {
    print(result2)
}

let (c, o) = getCompletedTimeAndSecondLater(completedString: "01:00:04.002", timespanString: "2.0s")
f.string(from: c)
f.string(from: o)

let (s, e) = getStartAndCompletedTime(completedString: "01:00:07.000", timespanString: "2s")
f.string(from: s)
f.string(from: e)

let (objs, obje) = getStartAndCompletedTime(completedString: "01:00:07.000", timespanString: "2.0s")
let (from, to) = getCompletedTimeAndSecondLater(completedString: "01:00:04.002", timespanString: "2s")
checkWasInBetween(objStart: objs, objEnd: obje, from: from, to: to)
