//
//  DropTableViewDelegate.swift
//  Dropdown
//
//  Created by Mohamed Salah on 2/4/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation
import UIKit

class DropTableViewDelegate: NSObject, UITableViewDelegate {
    //MARK:- Variables
    var stateController : DropdownStateController!
    var delegate : DropdownDelegate!
    var dropDown : DropdownViewController!
    
    //MARK:- Init
    init(_ dropDown : DropdownViewController, stateController : DropdownStateController,
         delegate : DropdownDelegate) {
        
        self.stateController = stateController
        self.delegate = delegate
        self.dropDown = dropDown
    }
    
    //MARK:- UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if dropDown.selectionType == .multiple {
            stateController.items[indexPath.row].selected = !stateController.items[indexPath.row].selected
        } else {
            self.manageSelection(index : indexPath.row)
        }
        
        tableView.reloadData()
        
        if delegate != nil {
            delegate.didFinishSelection(dropDown, selectedItems: stateController.items)
        }
    }
    
    //MARK:- Selection Handling 
    func manageSelection(index : Int) {
        
        for i in 0..<stateController.items.count {
            if i == index {
                stateController.items[i].selected = true
            } else {
                stateController.items[i].selected = false
            }
        }
    }
    
}
