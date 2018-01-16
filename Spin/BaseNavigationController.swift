//
//  BaseNavigationController.swift
//  Side Menu Small
//
//  Created by Mohamed Salah on 2/1/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit
import SideMenu

class BaseNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SideMenuManager.menuWidth = self.view.frame.width * 0.75
        SideMenuManager.menuAnimationBackgroundColor = UIColor.clear
        SideMenuManager.menuPresentMode = .menuSlideIn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
