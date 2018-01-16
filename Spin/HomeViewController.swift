//
//  HomeViewController.swift
//  Spin
//
//  Created by Mivors on 1/13/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    //MARK:- IBOutlets
    
    //MARK:- Variables
    var selectedIndex = 0
    var moreTabType : HomeButtons!

    let STAY_SEGUE = "fromHomeToStay"
    let CALCS_SEGUE = "fromHomeToCalcs"
    let ECME_SEGUE = "fromHomeToECME"
    let CASE_SEGUE = "fromHomeToCASE"
    let SETTING_SEGUE = "fromHomeToSettings"
    let ABOUT_SEGUE = "fromHomeToAbout"
    let VIDEOS_SEGUE = "fromHomeToVideos"
    let CORNER_SEGUE = "fromHomeToMYCorner"
    let EVENTS_SEGUE = "fromHomeToEvents"
    
    
    //MARK:- UI Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

    
    //MARK:- IBActions
    @IBAction func btnClicked(_ sender: UIButton) {
        let type : HomeButtons = HomeButtons(rawValue: sender.tag)!
        
        switch type {
        case .stayUpdated:
            self.performSegue(withIdentifier: STAY_SEGUE, sender: self)
            break
        case .vte:
            self.performSegue(withIdentifier: CALCS_SEGUE, sender: self)
            break
        case .eCME:
            self.performSegue(withIdentifier: ECME_SEGUE, sender: self)
            break
        case .caseStudies:
            self.performSegue(withIdentifier: CASE_SEGUE, sender: self)
            break
        case .about:
            self.performSegue(withIdentifier: ABOUT_SEGUE, sender: self)
            break
        case .myCorner:
            self.performSegue(withIdentifier: CORNER_SEGUE, sender: self)
            break
        case .videos:
            self.performSegue(withIdentifier: VIDEOS_SEGUE, sender: self)
            break
        case .news_events:
            self.performSegue(withIdentifier: EVENTS_SEGUE, sender: self)
            break
        }
        
        
        
    }
    
    @IBAction func btnMattersClicked(_ sender: Any) {
        self.showWebView(url: "http://www.vtematters.co.uk/")
    }
    
}
