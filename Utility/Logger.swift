//
//  Logger.swift
//  Fury
//
//  Created by Mikhail Fokin on 08/03/2018.
//  Copyright © 2018 Mikhail Fokin. All rights reserved.
//

import Foundation

enum LogEvent: String {
    case e = "[‼️]" // error
    case i = "[ℹ️]" // info
    case d = "[💬]" // debug
    case v = "[🔬]" // verbose
    case w = "[⚠️]" // warning
    case s = "[🔥]" // severe
}

class Logger {
    // 1. The date formatter
    static var dateFormat = "yyyy-MM-dd hh:mm:ssSSS" // Use your own
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    
    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
    
    class func log(message: String, // 1.
        event: LogEvent, // 2.
        fileName: String = #file, // 3.
        line: Int = #line, // 4.
        column: Int = #column,// 5.
        funcName: String = #function)  // 6.
    {
        #if DEBUG // 7.
            print("\(Date().toString()) \(event.rawValue)[\(sourceFileName(filePath: fileName))]:\(line) \(column) \(funcName) -> \(message)")
        #endif // 7.
    }
}
// 2. The Date to String extension
extension Date {
    func toString() -> String {
        return Logger.dateFormatter.string(from: self as Date)
    }
}
