//
//  DateExtension.swift
//  GitJournal
//
//  Created by Maxwell Poffenbarger on 10/8/20.
//

import Foundation

extension Date {
    
    func formatToString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter.string(from: self)
    }
}
