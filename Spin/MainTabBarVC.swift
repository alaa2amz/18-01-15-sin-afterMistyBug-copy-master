//
//  MainTabBarVC.swift
//  Spin
//
//  Created by Mohamed Salah on 2/11/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class MainTabBarVC: UITabBarController {
    //MARK: - Variables
    static var instance : MainTabBarVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainTabBarVC.instance = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
