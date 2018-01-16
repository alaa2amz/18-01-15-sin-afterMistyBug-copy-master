//
//  TipsTableHandler.swift
//  Spin
//
//  Created by Mohamed Salah on 2/25/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit
import ExpandableCell

class TipsTableHandler: NSObject,UITableViewDataSource,UITableViewDelegate {
   
    
    //MARK:- Variables
    var stateController : MyCornerStateController!
    let CELL_IDENTIFIER = "tipCell"
    
    
    //MARK:- Init
    init(stateCtrl : MyCornerStateController) {
        self.stateController = stateCtrl
    }
    
    
    //MARK:- DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return stateController.myCornerData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("az---")
        print(String(stateController.myCornerData.count))
        //return stateController.myCornerData[stateController.selectedCornerIndex].tips.count
        return stateController.myCornerData[section].tips.count
        
    }
    
    
   
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath)  as? CornerCell
        
       // let currentCorner = stateController.myCornerData[stateController.selectedCornerIndex]
        //let currentTip = currentCorner.tips[indexPath.row]
        
       // let textView = cell.viewWithTag(-1) as! UITextView
        if indexPath.row % 2 == 0 { cell?.contentLabel.text = stateController.myCornerData[indexPath.row / 2].corner} else {cell?.contentLabel.text = stateController.myCornerData[indexPath.row / 2].tips[0].body! }
        
        
        return cell!
    }
    
    
}
