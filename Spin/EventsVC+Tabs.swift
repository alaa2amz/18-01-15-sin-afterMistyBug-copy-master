//
//  EventsVC+Tabs.swift
//  Spin
//
//  Created by Mohamed Salah on 2/25/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation


extension EventsVC : WebDelegate {
    
    //MARK:- IBAction For Tabs 
    @IBAction func btnTabClicked (_ sender: UIButton) {
        if sender == btnEvents {
            btnEvents.backgroundColor = AppColors.selectedTab
            btnNewsletter.backgroundColor = AppColors.tab
            
            viewCalendarParent.alpha = 0.0
            tableEvents.alpha = 1.0
            tableNewsletter.alpha = 0.0
        } else {
            btnNewsletter.backgroundColor = AppColors.selectedTab
            btnEvents.backgroundColor = AppColors.tab
            
            viewCalendarParent.alpha = 0.0
            tableEvents.alpha = 0.0
            tableNewsletter.alpha = 1.0
            activateNewsletter()
        }
    }
    
    //MARK: Activiation
    func activateNewsletter () {
        if newsletterSC == nil {
            newsletterSC = NewsletterStateController()
            newletterTableHandler = NewsletterTableHandler(stateCtrl: newsletterSC, webViewDelegate: self)
            tableNewsletter.dataSource = newletterTableHandler
            tableNewsletter.delegate = newletterTableHandler
            
            tableNewsletter.tableFooterView = UIView()
            
            self.activityIndicator.startAnimating()
            newsletterSC.getNewsletter(completion: { (error) in
                self.activityIndicator.stopAnimating()
                if error != nil {
                    self.show(error: error)
                } else {
                    self.tableNewsletter.reloadData()
                }
            })
        }
    }
    
    //MARK:- WEB VIEW
    func startWebView(url: String) {
        self.showWebView(url: url)
    }
    
}
