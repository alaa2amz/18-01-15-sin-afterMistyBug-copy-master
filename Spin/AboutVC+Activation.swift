//
//  AboutVC+Activation.swift
//  Spin
//
//  Created by Mohamed Salah on 2/10/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

extension AboutViewController {
    //MARK:- Tab Activation
    
    func activateAboutTab () {
        self.indicatior.stopAnimating()
        btnAbout.backgroundColor = selectionColor
        btnNews.backgroundColor = normalColor
        btnFAQ.backgroundColor = normalColor
        btnQA.backgroundColor = normalColor
        
        subNewsTable.isHidden = true
        subFAQTable.isHidden = true
        subQA.isHidden = true
        subAsk.isHidden = true
        
        
        if aboutStateController == nil {
            aboutStateController = AboutStateController()
            self.subAbout.isHidden = false
        } else {
            self.subAbout.isHidden = false
        }
    }
    
    func activateNewsTab () {
        self.indicatior.stopAnimating()
        btnNews.backgroundColor = selectionColor
        btnAbout.backgroundColor = normalColor
        btnFAQ.backgroundColor = normalColor
        btnQA.backgroundColor = normalColor
        
        subAbout.isHidden = true
        subFAQTable.isHidden = true
        subQA.isHidden = true
        subAsk.isHidden = true
        
        if newsStateController == nil {
            newsStateController = NewsStateController()
            self.subNewsTable.isHidden = false
        } else {
            self.subNewsTable.isHidden = false
        }
    }
    
    func activateFAQTab () {
        self.indicatior.startAnimating()
        
        btnFAQ.backgroundColor = selectionColor
        btnAbout.backgroundColor = normalColor
        btnNews.backgroundColor = normalColor
        btnQA.backgroundColor = normalColor
        
        subAbout.isHidden = true
        subNewsTable.isHidden = true
        subQA.isHidden = true
        subAsk.isHidden = true
        
        if fAQStateController == nil {
            fAQStateController = FAQStateController()
            fAQDataSource = FAQTableDataSource(stateController: fAQStateController)
            
            subFAQTable.dataSource = fAQDataSource
            
            fAQStateController.getPosts(completion: { (error) in
                self.indicatior.stopAnimating()
                if error != nil {
                    self.show(error: error)
                }
                else {
                    self.subFAQTable.isHidden = false
                    self.subFAQTable.reloadData()
                }
            })
        } else {
            self.indicatior.stopAnimating()
            self.subFAQTable.isHidden = false
        }
    
    }
    
    func activateQATab () {
        self.indicatior.startAnimating()
        
        btnQA.backgroundColor = selectionColor
        btnAbout.backgroundColor = normalColor
        btnNews.backgroundColor = normalColor
        btnFAQ.backgroundColor = normalColor
        
        subAbout.isHidden = true
        subNewsTable.isHidden = true
        subFAQTable.isHidden = true
        subAsk.isHidden = true
        
        if questionsStateController == nil {
            questionsStateController = QAStateController()
            questionsDataSource = QATableDataSource(stateController: questionsStateController)
            
            questionsTable.dataSource = questionsDataSource
            
            questionsStateController.getPosts(completion: { (error) in
                self.indicatior.stopAnimating()
                if error != nil {
                    self.show(error: error)
                }
                else {
                    self.questionsTable.reloadData()
                }
                self.subQA.isHidden = false
            })
        } else {
            self.indicatior.stopAnimating()
            self.subQA.isHidden = false
        }
    }
    
}
