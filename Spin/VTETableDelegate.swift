//
//  VTETableDelegate.swift
//  Spin
//
//  Created by Mohamed Salah on 1/28/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class VTETableDelegate: NSObject, UITableViewDelegate {
    //MARK:- variables 
    var stateController : VTEStateController!
    
    //MARK:- Init
    init (stateController : VTEStateController){
        self.stateController = stateController
    }
    
    //MARK:- Set the heights of cells
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 27:
            return 52.0
        case 28:
            return 276.0
        case 0, 12:
            return 82.0
        case 22:
            return 143.0
        default:
            let term = stateController.vteTerms.terms[indexPath.row].term
            return term.characters.count > 100 ? 123.0 : 52.0
        }
    }
    
    
    
}
