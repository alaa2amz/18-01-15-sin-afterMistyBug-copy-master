//
//  DropdownItem.swift
//  Dropdown
//
//  Created by Mohamed Salah on 2/4/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation

struct DropdownItem {
    var id = ""
    var name : String = ""
    var selected : Bool = false
    
    init(id : String, name : String) {
        self.id = id
        self.name = name
    }
}
