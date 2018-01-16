//
//  VTETableDataSource.swift
//  Spin
//
//  Created by Mohamed Salah on 1/28/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class VTETableDataSource : NSObject, UITableViewDataSource {
    //MARK:- variables 
    var stateController : VTEStateController!
    
    //MARK:- Init 
    init(stateController : VTEStateController) {
        self.stateController = stateController
    }
    
    //MARK:- Table Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stateController.vteTerms.terms.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return stateController.createCell(tableView: tableView, indexPath: indexPath)
    }
    
}
