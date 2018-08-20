//
//  DataModel.swift
//  Checklists
//
//  Created by Joseph Goldberg on 8/20/18.
//  Copyright © 2018 Joseph Goldberg. All rights reserved.
//

import Foundation

class DataModel {
    var lists: [Checklist] = []
    
    var indexOfSelectedChecklist: Int {
        get {
            return UserDefaults.standard.integer(forKey: "ChecklistIndex")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "ChecklistIndex")
        }
    }
    
    init() {
        loadChecklists()
        registerDefaults()
    }
    
    func registerDefaults() {
        let dictionary = ["ChecklistIndex": -1]
        UserDefaults.standard.register(defaults: dictionary)
    }
    
    // MARK: - Serialization
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
    
    func saveChecklists() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(lists)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
            
        } catch {
            print("Error encoding item array!")
        }
    }
    
    func loadChecklists() {
        if let data = try? Data(contentsOf: dataFilePath()) {
            let decoder = PropertyListDecoder()
            do {
                lists = try decoder.decode([Checklist].self, from: data)
            } catch {
                print("Error decoding item array!")
            }
        }
    }
}
