//
//  CalcButtonsTableViewCell.swift
//  Spin
//
//  Created by Mohamed Salah on 1/28/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class CalcButtonsTableViewCell: UITableViewCell {
    //MARK:- IBOutlets
    @IBOutlet weak var btnPost: UIButton!
    @IBOutlet weak var btnAnt: UIButton!
    
    
    //MARK:- Variables 
    var delegate : CalculateDelegate!
    
    //MARK:- UI Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- IBActions
    @IBAction func btnTypeClicked(_ sender: UIButton) {
        if sender == btnAnt {
            VTEStateController.calcType = .antenatal
            delegate.calculateDidTapped()
        } else {
            VTEStateController.calcType = .postnatal
            delegate.calculateDidTapped()
        }
    }
    

}
