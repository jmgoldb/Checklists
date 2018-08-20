//
//  Checklist.swift
//  Checklists
//
//  Created by Joseph Goldberg on 8/19/18.
//  Copyright © 2018 Joseph Goldberg. All rights reserved.
//

import Foundation

class Checklist: Equatable, Codable {
    var name = ""
    var items: [ChecklistItem] = []
    
    init(name: String) {
        self.name = name
    }
    static func == (lhs: Checklist, rhs: Checklist) -> Bool {
        return
            lhs.name == rhs.name
        
    }
}
