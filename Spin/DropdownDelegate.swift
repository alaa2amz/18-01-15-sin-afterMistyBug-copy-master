//
//  DropdownDelegate.swift
//  Dropdown
//
//  Created by Mohamed Salah on 2/4/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation

protocol DropdownDelegate {
    func didFinishSelection (_ dropDown : DropdownViewController, selectedItems : [DropdownItem])
}
