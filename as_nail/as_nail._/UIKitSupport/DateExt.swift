//
//  DateExt.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 11.10.2023.
//

import UIKit

extension Date {
//    var startDateOfMonth: Date {
//        let components = Calendar.dateComponents([.year, .month], from: self)
//        guard let date = Calendar.gregorian.date(from: components) else {
//            fatalError("Unable to get start date from date")
//        }
//        return date
//    }
//
//    var endDateOfMonth: Date {
//        guard let date = Calendar.current.date(
//            byAdding: DateComponents(month: 1, day: -1),
//            to: self.startDateOfMonth
//        ) else {
//            fatalError("Unable to get end date from date")
//        }
//        return date
//    }
//
//    var isStartDateOfMonth: Bool {
//        Calendar.current.isDate(self, inSameDayAs: startDateOfMonth)
//    }
//
//    var isEndDateOfMonth: Bool {
//        Calendar.current.isDate(self, inSameDayAs: endDateOfMonth)
//    }
    
    func startOfMonth() -> Date {
        let interval = Calendar.current.dateInterval(of: .month, for: self)
        return (interval?.start.toLocalTime())!
    }

    func endOfMonth() -> Date {
        let interval = Calendar.current.dateInterval(of: .month, for: self)
        return interval!.end
    }

    // Convert UTC (or GMT) to local time
    func toLocalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
}
