//
//  AboutViewController.swift
//  Spin
//
//  Created by Mohamed Salah on 2/10/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class AboutViewController: BaseViewController {
    //MARK:- Buttons
    @IBOutlet weak var btnAbout: UIButton!
    @IBOutlet weak var btnNews: UIButton!
    @IBOutlet weak var btnFAQ: UIButton!
    @IBOutlet weak var btnQA: UIButton!
    @IBOutlet weak var btnSubmitAsk: UIButton!
    
    //MARK:- Indicator
    @IBOutlet weak var indicatior: UIActivityIndicatorView!
    
    //MARK:- Sub Views
    @IBOutlet weak var subAbout: UIScrollView!
    @IBOutlet weak var subNewsTable: UIScrollView!
    @IBOutlet weak var subFAQTable: UITableView!
    @IBOutlet weak var subQA: UIView!
    @IBOutlet weak var questionsTable: UITableView!
    @IBOutlet weak var subAsk: UIView!
    
    // MARK:- State Controllers
    var newsStateController : NewsStateController!
    var fAQStateController : FAQStateController!
    var questionsStateController : QAStateController!
    var aboutStateController : AboutStateController!
    
    //MARK:- Tables Data Sources 
    var newsDataSource : NewsTableDataSource!
    var fAQDataSource : FAQTableDataSource!
    var questionsDataSource : QATableDataSource!
    
    //MARK:- Variables
    var selectionColor : UIColor = AppColors.selectedTab
    var normalColor : UIColor = AppColors.tab
    
    //MARK:- view controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePageTitle()
        activateAboutTab()
        configureButtons()
        
        subFAQTable.tableFooterView  = UIView()
        questionsTable.tableFooterView  = UIView()
    }
    
    //MARK: - Configuration
    func configureButtons () {
        btnNews.titleLabel?.numberOfLines = 0
        btnNews.titleLabel?.lineBreakMode = .byWordWrapping
    }

    func configurePageTitle(){
        let frame : CGRect = CGRect(x: 0, y: 0, width: 100, height: 30)
        let label : UILabel = UILabel(frame: frame)
        
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Nexa Light", size: 22.0)
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        label.text = "About Sanofi"
        
        self.navigationItem.titleView = label
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    //MARK:- IBActions
    @IBAction func btnTabClicked(_ sender: UIButton) {
        switch sender {
        case btnAbout:
            activateAboutTab()
            break
        case btnNews:
            activateNewsTab()
            break
        case btnFAQ:
            activateFAQTab()
            break
        case btnQA:
            activateQATab()
            break
        default:
            break
        }
        
    }
    
    @IBAction func btnAskQClicked(_ sender: UIButton) {
        self.subQA.isHidden = true
        self.subAsk.isHidden = false
    }
    
    @IBAction func textFeildAskChanged(_ sender: UITextField) {
        questionsStateController.currentQuestion = sender.text!
    }
    
    @IBAction func btnSubmitAskClicked(_ sender: UIButton) {
        self.startProgressAnimation()
        questionsStateController.submitQuestion { (error) in
            self.stopProgressAnimation()
            if error != nil {
                self.show(error: error)
            } else {
                let alertVC = QuestionAlertVC(message: self.questionsStateController.successMessage)
                self.present(alertVC, animated: true, completion: nil)
                
                self.subQA.isHidden = false
                self.subAsk.isHidden = true
            }
        }
        
    }
}
