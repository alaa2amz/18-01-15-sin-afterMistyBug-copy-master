//
//  CornerCell.swift
//  Spin
//
//  Created by A on 12/5/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class CornerCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
