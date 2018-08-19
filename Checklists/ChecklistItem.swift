//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Joseph Goldberg on 8/19/18.
//  Copyright © 2018 Joseph Goldberg. All rights reserved.
//

import Foundation

class ChecklistItem: Equatable {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
    
    static func == (lhs: ChecklistItem, rhs: ChecklistItem) -> Bool {
        return
            lhs.checked == rhs.checked &&
            lhs.text == rhs.text
    }
}

