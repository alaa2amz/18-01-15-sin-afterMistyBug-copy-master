//
//  SubTitleTableCell.swift
//  Spin
//
//  Created by Mohamed Salah on 3/10/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation
class SubTitleTableCell: UITableViewCell {
    
    //MARK:- IBOutlets
    @IBOutlet weak var labelFrstCol: UILabel!
    
    @IBOutlet weak var labelSecCol: UILabel!
    
    @IBOutlet weak var labelScore: UILabel!
    
    //MARK:- UI Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
