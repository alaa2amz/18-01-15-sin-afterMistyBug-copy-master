//
//  SettingsVC.swift
//  Spin
//
//  Created by Mohamed Salah on 2/27/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class SettingsVC: BaseViewController {
    //MARK:- IBOultets
    @IBOutlet weak var imageViewPPic: UIImageView!
    
    //MARK:- Variables
    
    //MARK:- View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configurePageTitle()
    }

    //MARK:- Configuratiuon
    func configurePageTitle(){
        let frame : CGRect = CGRect(x: 0, y: 0, width: 100, height: 30)
        let label : UILabel = UILabel(frame: frame)
        
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Nexa Light", size: 22.0)
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        label.text = "Settings"
        
        self.navigationItem.titleView = label
    }
}
