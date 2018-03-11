//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Candidate {
    var name : String!
    var votes : Int!
    
    init(name : String, votes : Int) {
        self.name = name
        self.votes = votes
    }
}

func electionWinner(votes: [String]) -> String {
    var voteResultArray = [Candidate]()
    for candidateName in votes {
        // check if result array contains current candidate
        let contains = voteResultArray.contains(where: { (candidate) -> Bool in
            return candidate.name == candidateName
        })
        if contains {
            for v in voteResultArray {
                if v.name == candidateName {
                    v.votes = v.votes + 1 // add a vote
                }
            }
        } else {
            voteResultArray.append(Candidate(name: candidateName, votes: 1)) // append new candidate with initial vote
        }
    }
    let sortedArray = voteResultArray.sorted { (c1, c2) -> Bool in
        if c1.votes == c2.votes {
            return c1.name > c2.name // name desc
        }
        return c1.votes > c2.votes // votes desc
    }
    return sortedArray.first!.name
}

let array = ["Alex", "Michael", "Harry", "Dave", "Michael", "Victor", "Harry", "Alex", "Mary", "Mary"]
electionWinner(votes: array)

let array2 = ["Victor", "Veronica", "Ryan", "Dave", "Maria", "Maria", "Farah", "Farah", "Ryan", "Veronica"]
electionWinner(votes: array2)
