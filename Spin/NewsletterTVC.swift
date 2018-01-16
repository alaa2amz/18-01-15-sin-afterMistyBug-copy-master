//
//  NewsletterTVC.swift
//  Spin
//
//  Created by Mohamed Salah on 2/25/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class NewsletterTVC: UITableViewCell {
    
    @IBOutlet weak var imageViewNewsletter: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDetails: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelShared: UILabel!
    @IBOutlet weak var labelNew: UILabel!
    
    @IBAction func btnMoreClicked(_ sender: UIButton) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
