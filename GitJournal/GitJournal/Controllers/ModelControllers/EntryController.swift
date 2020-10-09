//
//  EntryController.swift
//  GitJournal
//
//  Created by Maxwell Poffenbarger on 10/8/20.
//

import Foundation

class EntryController {
    
    //MARK: - Properties
    static let sharedInstance = EntryController()
    
    var entries: [Entry] = []
    
    init() {
        loadFromPersistantStore()
    }
    
    //MARK: - CRUD Functions
    func addEntryWith(title: String, text: String) {
        let newEntry = Entry(title: title, text: text)
        entries.append(newEntry)
        saveToPersistentStore()
    }
    
    func remove(entry: Entry) {
        guard let index = entries.firstIndex(of: entry) else {return}
        self.entries.remove(at: index)
        saveToPersistentStore()
    }
    
    func update(entry: Entry, title: String, text: String) {
        entry.title = title
        entry.text = text
        saveToPersistentStore()
    }
    
    //MARK: PERSISTENCE
    func createFileForPersistence() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("Entry.json")
        return fileURL
    }
    
    func saveToPersistentStore() {
        let jsonEncoder = JSONEncoder()
        do {
            let jsonEntries = try jsonEncoder.encode(entries)
            try jsonEntries.write(to: createFileForPersistence())
        } catch let encodingError {
            print("There was an error saving the data! \(encodingError.localizedDescription)")
        }
    }
    
    func loadFromPersistantStore() {
        let jsonDecoder = JSONDecoder()
        do {
            let jsonData = try Data(contentsOf: createFileForPersistence())
            let decodedEntryArray = try jsonDecoder.decode([Entry].self, from: jsonData)
            entries = decodedEntryArray
        } catch let decodingError {
            print("There was an error loading the data! \(decodingError.localizedDescription)")
        }
    }
}//end of class

