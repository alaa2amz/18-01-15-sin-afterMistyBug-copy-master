//
//  CalcTermTableViewCell.swift
//  Spin
//
//  Created by Mohamed Salah on 1/28/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class CalcTermTableViewCell: UITableViewCell {
    //MARK:- IBOutlets 
    
    @IBOutlet weak var labelTerm: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var btnCheckbox: UIButton!
    @IBOutlet weak var imageTerm: UIImageView!

    @IBOutlet weak var headerLabelOne: UILabel!
    @IBOutlet weak var headerLabelTwo: UILabel!
    @IBOutlet weak var headerLabelThree: UILabel!
    
    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    
    //MARK:- variables 
    var item : VTETerm!
    weak var parentTable : UITableView!
    
    let defualtHeaderHeight : CGFloat = 20.0
    
    //MARK:- UI Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setButtonImage () {
        switch item.selected {
        case true:
            btnCheckbox.setBackgroundImage(UIImage(named: "ic_checkbox_selected_calc"), for: .normal)
            self.labelScore.text = "\(item.score)"
            break
        case false:
            btnCheckbox.setBackgroundImage(UIImage(named: "ic_checkbox_calc"), for: .normal)
            self.labelScore.text = ""
            break
        }
        
    }
    
    //MARK:- IBActions 
    @IBAction func btnCheckboxClicked(_ sender: UIButton) {
        item.selected = !item.selected
        setButtonImage()
        
        VTEStateController.total += item.selected ? item.score : 0
        VTEStateController.total -= !item.selected ? item.score : 0
        
        self.parentTable.reloadData()
    }

}
