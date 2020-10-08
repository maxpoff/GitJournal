//
//  Entry.swift
//  GitJournal
//
//  Created by Maxwell Poffenbarger on 10/8/20.
//

import Foundation

class Entry: Codable {
    
    var title: String
    var text: String
    var timestamp: Date = Date()
    
    init(title: String, text: String, timestamp: Date = Date()) {
        
        self.title = title
        self.text = text
        self.timestamp = timestamp
    }
}//end of class

extension Entry: Equatable {
    
        static func == (lhs: Entry, rhs: Entry) -> Bool {
            return lhs.title == rhs.title && lhs.text == rhs.text && lhs.timestamp == rhs.timestamp
    }
}//end of extension

