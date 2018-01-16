//
//  CaseStudyCell.swift
//  Spin
//
//  Created by Mohamed Salah on 3/11/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class CaseStudyCell: UITableViewCell {
    //MARK:- IBOutlets
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelBody: UILabel!
    
    //MARK:- Variables
    var webDelegate: WebDelegate!
    var link: String = ""
    
    //MARK:- Cell Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btnReadMoreClicked(_ sender: Any) {
        webDelegate.startWebView(url: link)
    }
    
    
}
