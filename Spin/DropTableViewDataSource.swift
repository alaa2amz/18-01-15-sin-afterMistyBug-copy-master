//
//  DropTableViewDataSource.swift
//  Dropdown
//
//  Created by Mohamed Salah on 2/4/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class DropTableViewDataSource: NSObject, UITableViewDataSource {
    //MARK:- Variables 
    var stateController : DropdownStateController!
    var CELL_ID = "DropTableViewCell"
    
    //MARK:- Init 
    init(stateController : DropdownStateController) {
        self.stateController = stateController
    }
    
    //MARK:- UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateController.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! DropTableViewCell
        
        cell.labelName.text = stateController.items[indexPath.row].name
        
        if stateController.items[indexPath.row].selected {
            cell.imageViewCheck.image = UIImage(named: "ic_check_selected")
        } else {
            cell.imageViewCheck.image = UIImage(named: "ic_check")
        }
        return cell
    }
    
}
