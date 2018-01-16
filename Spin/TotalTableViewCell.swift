//
//  TotalTableViewCell.swift
//  Spin
//
//  Created by Mohamed Salah on 1/28/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class TotalTableViewCell: UITableViewCell {
    //MARK:- IBOutlets
    @IBOutlet weak var labelTotal: UILabel!
    
    //MARK:- variables
    
    //MARK:- UI Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func btnTotalClicked(_ sender: Any) {
        self.labelTotal.text = "\(VTEStateController.total)"
    }

}
