//
//  EcmeTVC.swift
//  Spin
//
//  Created by Mohamed Salah on 3/11/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class EcmeTVC: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelBody: UILabel!
    @IBOutlet weak var imageCourse: UIImageView!
    
    var webDelegate: WebDelegate!
    var link = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btnArrowClicked(_ sender: Any) {
        webDelegate.startWebView(url: link)
    }
}
