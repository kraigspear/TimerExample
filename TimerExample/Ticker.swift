//
//  Ticker.swift
//  TimerExample
//
//  Created by Kraig Spear on 7/15/23.
//

import Foundation

// Type to represent the Ticker
// CustomStringConvertible gives us the description property, allowing us to format it in strings easily
struct Ticker: CustomStringConvertible {
    // We make strings because we just might as well format to what is being displayed
    let days: String
    let hours: String
    let minutes: String
    let seconds: String
    
    init(dateComponents: DateComponents) {
        // Gives us the leading zero
        let format = "%02d"

        // In a production App we might want to be more exploit about error handling.
        // Since we're calling this internally we know we have all of the components, but it's
        // iffy to use a default of 0 if it's missing.
        
        days = String(format: format, dateComponents.day ?? 0)
        hours = String(format: format, dateComponents.hour ?? 00)
        minutes = String(format: format, dateComponents.minute ?? 0)
        seconds = String(format: format, dateComponents.second ?? 0)
    }
    
    var description: String {
        "Days: \(days) Hours: \(hours) Minutes: \(minutes) Seconds: \(seconds)"
    }
}
