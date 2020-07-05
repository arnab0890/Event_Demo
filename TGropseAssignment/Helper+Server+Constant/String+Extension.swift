//
//  String+Extension.swift
//  CircleK
//
//  Created by Hitesh Dhawan on 17/07/18.
//  Copyright © 2018 Varun Tyagi. All rights reserved.
//

import Foundation
import UIKit
extension String {
    func getCodeFromCountryJson() -> [[String:Any]] {
        let path = Bundle.main.path(forResource: self, ofType: "json")
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let country = jsonResult["countries"] as? [[String:Any]] {
                return  country
            }
        } catch {
        }
        return []
    }
    
       
    var withoutHtmlTags: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    func convertToDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    func convertToArray() -> [Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func timeIntervaltoDate() -> (String?, Int)  {
        var miliSecond = 0
        var lastTimeValue = 0.0
        let f = DateFormatter()
        f.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let startDate = Date()
        let endDate: Date? = f.date(from: self)
        let currentCalendar = Calendar.current
        var differenceComponents: DateComponents? = nil
        if let aDate = endDate {
            differenceComponents = currentCalendar.dateComponents([.day, .hour, .minute, .second], from: startDate, to: aDate)
        }
        let dayDifference = differenceComponents?.day
        let hourDifference = differenceComponents?.hour
        let minuteDifference = differenceComponents?.minute
        let secondDifference = differenceComponents?.second
       let miliHours = ((hourDifference! * 60) * 60) * 1000
       let miliMinuts = (minuteDifference! * 60) * 1000
        let secondMili = secondDifference! * 1000
        miliSecond = (miliHours + miliMinuts + secondMili)/1000
        if dayDifference! > 0 {
            return (String(format: "%02ld days", dayDifference!), miliSecond)
        } else {
            let finalValue: Double = Double((hourDifference! * 60) + minuteDifference!)
            lastTimeValue = finalValue
            return (String(format: "%.0f", lastTimeValue) , miliSecond)
        }
        
    }
    func getDayComponentFromDateStr() -> DateComponents? {
         let f = DateFormatter()
        f.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let startDate = Date()
        let endDate: Date? = f.date(from: self)
        let currentCalendar = Calendar.current
        var differenceComponents: DateComponents? = nil
        if let aDate = endDate {
            differenceComponents = currentCalendar.dateComponents([.second], from: startDate, to: aDate)
        }
        return differenceComponents
    }
}


extension Dictionary {
    
    var json: String {
        let invalidJson = ""
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
        } catch {
            return invalidJson
        }
    }
    
    func printJson() {
        print(json)
    }
    
    
}
extension String {
     func join(_ value:String) -> String {
        return "\(self)\(value)"
    }
}
extension Array {
    
    var json: String {
        let invalidJson = ""
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
        } catch {
            return invalidJson
        }
    }
    
    func printJson() {
        print(json)
    }
    
}
extension Date {
    
    func offset(from: Date) -> (Calendar.Component, Int)? {
        let descendingOrderedComponents = [Calendar.Component.year, .month, .day, .hour, .minute]
        let dateComponents = Calendar.current.dateComponents(Set(descendingOrderedComponents), from: from, to: self)
        let arrayOfTuples = descendingOrderedComponents.map { ($0, dateComponents.value(for: $0)) }
        
        for (component, value) in arrayOfTuples {
            if let value = value, value > 0 {
                return (component, value)
            }
        }
        
        return nil
    }
    
}
extension Date {
    func timeAgoSinceDate(_ numericDates:Bool = false) -> String {
        let calendar = NSCalendar.current
        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
        let now = Date()
        let earliest = now < self ? now : self
        let latest = (earliest == now) ? self : now
        let components = calendar.dateComponents(unitFlags, from: earliest,  to: latest)
        
        if (components.year! >= 2) {
            return "\(components.year!) years ago"
        } else if (components.year! >= 1){
            if (numericDates){
                return "1 year ago"
            } else {
                return "Last year"
            }
        } else if (components.month! >= 2) {
            return "\(components.month!) months ago"
        } else if (components.month! >= 1){
            if (numericDates){
                return "1 month ago"
            } else {
                return "Last month"
            }
        } else if (components.weekOfYear! >= 2) {
            return "\(components.weekOfYear!) weeks ago"
        } else if (components.weekOfYear! >= 1){
            if (numericDates){
                return "1 week ago"
            } else {
                return "Last week"
            }
        } else if (components.day! >= 2) {
            return "\(components.day!) days ago"
        } else if (components.day! >= 1){
            if (numericDates){
                return "1 day ago"
            } else {
                return "Yesterday"
            }
        } else if (components.hour! >= 2) {
            return "\(components.hour!) hours ago"
        } else if (components.hour! >= 1){
            if (numericDates){
                return "1 hour ago"
            } else {
                return "An hour ago"
            }
        } else if (components.minute! >= 2) {
            return "\(components.minute!) minutes ago"
        } else if (components.minute! >= 1){
            if (numericDates){
                return "1 minute ago"
            } else {
                return "A minute ago"
            }
        } else if (components.second! >= 3) {
            return "\(components.second!) seconds ago"
        } else {
            return "Just now"
        }
        
    }
    
    func getElapsedInterval() -> String {
        
        let interval = Calendar.current.dateComponents([.year, .month, .day], from: self, to: Date())
        
        if let year = interval.year, year > 0 {
            return year == 1 ? "\(year)" + " " + "year ago" :
                "\(year)" + " " + "years ago"
        } else if let month = interval.month, month > 0 {
            return month == 1 ? "\(month)" + " " + "month ago" :
                "\(month)" + " " + "months ago"
        } else if let day = interval.day, day > 0 {
            return day == 1 ? "\(day)" + " " + "day ago" :
                "\(day)" + " " + "days ago"
        } else {
            return "a moment ago"
            
        }
        
    }
}
extension Date{
    
    ///- returns: (MONTH year Weekday)
    
    func getDayOfWeek() -> (String,String,String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "MMMM yyyy EEEE"//"EE" to get short style
        let desiredDate =  dateFormatter.string(from: self)//"Sunday"
        let dateArr = desiredDate.components(separatedBy: " ")
        return (dateArr[0],dateArr[1],dateArr[2])
    }
    func getLastMonthYear()->String{
        
        let previousMonthYear = Calendar.current.date(byAdding: .month, value: -1, to: Date())

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "yyyy"//"EE" to get short style
        let desiredDate =  dateFormatter.string(from: previousMonthYear!)//"Sunday"
        let dateArr = desiredDate.components(separatedBy: " ")
        return (dateArr.first)!
    }
}
extension String {
	mutating func addString(str: String) {
		self = self + str
	}
}
extension String {
    func stringTodate() -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let desiredDate = dateFormatter.date(from:self){
            return desiredDate
        }else{
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return  dateFormatter.date(from:self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)) ?? Date()

        }
    }
    func stringTodateString(fromFormate: String , withFormate: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormate
        let givenDate = dateFormatter.date(from:self)!
        
        let desiredDAteFormatter = DateFormatter()
        desiredDAteFormatter.dateFormat = withFormate
        
        return desiredDAteFormatter.string(from: givenDate)
    }
    func  getcheckinTime(_ checkinTime:String?) -> String  {
        if checkinTime == "0000-00-00 00:00:00" || (checkinTime?.isEmpty)!{
            return ""
        }
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "hh:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        let  desiredInDate =  checkinTime?.stringTodate()
        let dateInString = formatter.string(from:desiredInDate!)
        print(dateInString as Any)
        return dateInString
        
    }
}
extension UIDatePicker {
    func setDobValidation() {
        let currentDate: Date = Date()
        var calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone.current
        var components: DateComponents = DateComponents()
        components.calendar = calendar
        components.year = -18
        let maxDate: Date = calendar.date(byAdding: components, to: currentDate)!
        components.year = -100
        let minDate: Date = calendar.date(byAdding: components, to: currentDate)!
        self.minimumDate = minDate
        self.maximumDate = maxDate
    }
    

    func setToday_FutureValidation() {
        let currentDate: Date = Date()
        var calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone.current
        var components: DateComponents = DateComponents()
        components.calendar = calendar
        components.day = 10
        let maxDate: Date = calendar.date(byAdding: components, to: currentDate)!
        components.day = 0
        let minDate: Date = calendar.date(byAdding: components, to: currentDate)!
        self.minimumDate = minDate
        self.maximumDate = maxDate
    }
    
    func setReportValidation() {
        let currentDate: Date = Date()
        var calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone.current
        var components: DateComponents = DateComponents()
        components.calendar = calendar
        components.year = 0
        let maxDate: Date = calendar.date(byAdding: components, to: currentDate)!
        components.year = -100
        let minDate: Date = calendar.date(byAdding: components, to: currentDate)!
        self.minimumDate = minDate
        self.maximumDate = maxDate
    }
    func setReportToValidation(_ minDateFrom: Date ) {
       
        let startDate = minDateFrom
        let endDate = Date(timeInterval: 60*60*24*180, since: startDate)
        
        let components = Calendar.current.dateComponents([.day], from: startDate, to: endDate)
        
        self.minimumDate = minDateFrom
        self.maximumDate = calendar.date(byAdding: components, to: minDateFrom)!
    }
    func setLeaveFromValidation() {
        let currentDate: Date = Date()
        var calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.timeZone = TimeZone.current
        var components: DateComponents = DateComponents()
        components.calendar = calendar
        components.month = 1
        let maxDate: Date = calendar.date(byAdding: components, to: currentDate)!
        components.month = 0
        let minDate: Date = calendar.date(byAdding: components, to: currentDate)!
        self.minimumDate = minDate
        self.maximumDate = maxDate
    }
    func setLeaveToValidation(_ minDateFrom: Date ) {
        
        let startDate = minDateFrom
        let endDate = Date(timeInterval: 60*60*24*30, since: startDate)
        
        let components = Calendar.current.dateComponents([.day], from: startDate, to: endDate)
        
        self.minimumDate = minDateFrom
        self.maximumDate = calendar.date(byAdding: components, to: minDateFrom)!
    }
    
}
extension Array where Element: Equatable {
    
    public func uniq() -> [Element] {
        var arrayCopy = self
        arrayCopy.uniqInPlace()
        return arrayCopy
    }
    
    mutating public func uniqInPlace() {
        var seen = [Element]()
        var index = 0
        for element in self {
            if seen.contains(element) {
                remove(at: index)
                
            } else {
                seen.append(element)
                index = index + 1
            }
        }
    }
}
