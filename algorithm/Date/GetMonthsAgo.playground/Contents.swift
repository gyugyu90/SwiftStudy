// 주어진 날짜의 n개월전 날짜를 반환하는 함수를 작성하세요. 대응하는 날이 없는 경우 해당 월의 마지막 날짜가 됩니다.
import UIKit

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"
// - Swift way of getting date of N months ago
// let date = dateFormatter.date(from: "2018-03-31")!
// Calendar.current.date(byAdding: .month, value: -3, to: date)

// solution
// n : n개월 전
// from : 주어진 날짜
// return => n개월 전 날짜
func getMonthsAgo(n months : Int, from date : Date) -> Date{
    let calendar = Calendar.current
    let year = calendar.component(.year, from: date)
    let month = calendar.component(.month, from: date)
    var day = calendar.component(.day, from: date)
    
    var pYear = year - months / 12
    var pMonth = month - months % 12
    if pMonth <= 0 {
        pMonth += 12
        pYear -= 1
    }
    
    let daysOfTheMonth = getDaysOfTheMonth(year : pYear, month: pMonth)
    if day > daysOfTheMonth {
        day = daysOfTheMonth
    }
    
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "yyyy-MM-dd"
    let dateString = String(format: "%d-%02d-%02d", arguments: [pYear, pMonth, day])
    // print(dateString)
    return dateformatter.date(from: dateString)!
}

// helper method
// 해당 연월의 마지막 날짜를 반환
func getDaysOfTheMonth(year : Int, month : Int) -> Int {
    switch month {
    case 1, 3, 5, 7, 8, 10, 12:
        return 31
    case 2:
        if year % 4 == 0 {
            return 29 // 4년의 한 번은 윤년
        }
        return 28
    default:
        return 30
    }
}

// test case
let date1 = dateFormatter.date(from: "2018-03-31")!
getMonthsAgo(n: 1, from: date1) // 2018-02-28
getMonthsAgo(n: 2, from: date1) // 2018-01-31
getMonthsAgo(n: 3, from: date1) // 2017-12-31
getMonthsAgo(n: 4, from: date1) // 2017-11-30
getMonthsAgo(n: 20000, from: date1) // 351-07-31

let date2 = dateFormatter.date(from: "2018-01-01")!
getMonthsAgo(n: 1, from: date2) // 2017-12-01
getMonthsAgo(n: 10, from: date2) // 2017-03-01
getMonthsAgo(n: 0, from: date2) // 2018-01-01
getMonthsAgo(n: -1, from: date2) // 2018-02-01
getMonthsAgo(n: -13, from: date2) // 2019-02-01



