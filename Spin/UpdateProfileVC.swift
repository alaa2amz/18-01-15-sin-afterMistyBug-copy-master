//
//  UpdateProfileVC.swift
//  Spin
//
//  Created by Mohamed Salah on 2/27/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class UpdateProfileVC: BaseViewController {
    //MARK:- IBOultets
    
    @IBOutlet weak var textFieldFirstName: UITextField!
    @IBOutlet weak var textFieldMiddleName: UITextField!
    @IBOutlet weak var textFieldLastName: UITextField!
    @IBOutlet weak var textFieldTitle: UITextField!
    
    //MARK:- Variables
    var stateController : ProfileStateController!
    
    //MARK:- View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configurePageTitle()
        
        stateController = ProfileStateController()
        
        textFieldFirstName.text = stateController.firstName
        textFieldMiddleName.text = stateController.middleName
        textFieldLastName.text = stateController.lastName
        textFieldTitle.text = stateController.currentTitle
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
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    //MARK:- IBAction
    
    @IBAction func btnSubmitClicked(_ sender: UIButton) {
        self.startProgressAnimation()
        
        stateController.update(type: .all) { (code, msg) in
            self.stopProgressAnimation()
            if code != 1 {
                self.show(error: msg)
            } else {
                let alertVC = QuestionAlertVC(message: msg)
                self.present(alertVC, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        if sender == textFieldFirstName {
            stateController.firstName = sender.text!
        } else if sender == textFieldMiddleName {
            stateController.middleName = sender.text!
        } else if sender == textFieldLastName {
            stateController.lastName = sender.text!
        } else if sender == textFieldTitle {
            stateController.currentTitle = sender.text!
        }
    }
    
}
