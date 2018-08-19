//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Joseph Goldberg on 8/19/18.
//  Copyright © 2018 Joseph Goldberg. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}

