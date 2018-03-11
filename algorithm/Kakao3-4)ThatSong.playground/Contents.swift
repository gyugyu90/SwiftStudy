//: Playground - noun: a place where people can play

import UIKit

let musicinfos1 = ["12:00,12:14,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"]
let musicinfos2 = ["03:00,03:30,FOO,CC#B", "04:00,04:08,BAR,CC#BCC#BCC#B"]
let musicinfos3 = ["12:00,12:14,HELLO,C#DEFGAB", "13:00,13:05,WORLD,ABCDEF"]

fileprivate func getNotes(note : String) -> [String] {
    let regex = try! NSRegularExpression(pattern: "[A-Z][#]?", options: [])
    return regex.matches(in: note, options: [], range: NSMakeRange(0, note.count)).map { (result) -> String in
        return String(note[Range(result.range, in: note)!])
    }
}

fileprivate func getPlayedTime(start : String, end : String) -> Int {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    let startTime = dateFormatter.date(from: start)!
    let endTime = dateFormatter.date(from: end)!
    let calendar = Calendar.current
    let elapsed = calendar.dateComponents(Set<Calendar.Component>([.minute]), from: startTime, to: endTime)
    return elapsed.minute!
}

fileprivate func getPlayedNotes(playtime : Int, notesArray : [String]) -> String {
    var playedNotes = ""
    for i in 0..<playtime {
        let index = i % notesArray.count
        playedNotes += notesArray[index]
    }
    return playedNotes
}

fileprivate func solution(m : String, musicinfo : [String]) -> String {
    let filteredMusicInfo = musicinfo.filter { (info) -> Bool in
        let parsedInfo = info.split(separator: ",").map{String($0)}
        let playTime = getPlayedTime(start: parsedInfo[0], end: parsedInfo[1])
        let notesArray = getNotes(note: parsedInfo[3])
        let playedNotes = getPlayedNotes(playtime: playTime, notesArray: notesArray)
        return playedNotes.contains(m)
    }
    if filteredMusicInfo.isEmpty {
        return "(None)"
    }
    
    let sortedMusicInfo = filteredMusicInfo.sorted { (info1, info2) -> Bool in
        let parsedInfo1 = info1.split(separator: ",").map{String($0)}
        let parsedInfo2 = info2.split(separator: ",").map{String($0)}
        return getPlayedTime(start: parsedInfo1[0], end: parsedInfo1[1]) > getPlayedTime(start: parsedInfo2[0], end: parsedInfo2[1])
    }
    return sortedMusicInfo.first!.split(separator: ",").map{String($0)}[2]
}

solution(m: "ABCDEFG", musicinfo: musicinfos1)
solution(m: "CC#BCC#BCC#BCC#B", musicinfo: musicinfos2)
solution(m: "ABC", musicinfo: musicinfos3)
