//
//  UpdatePasswordVC.swift
//  Spin
//
//  Created by Mohamed Salah on 2/27/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class UpdatePasswordVC: BaseViewController {
    //MARK:- IBOultets
    @IBOutlet weak var textFieldCurrentPass: UITextField!
    @IBOutlet weak var textFieldNewPass: UITextField!
    @IBOutlet weak var textFieldRePass: UITextField!
    
    
    //MARK:- Variables
    var stateController : ProfileStateController!
    
    //MARK:- View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configurePageTitle()
        
        stateController = ProfileStateController()
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
    
    //MARK:- IBActions
    @IBAction func btnChangeClicked(_ sender: Any) {
        
        if let validationError = stateController.validate() {
            self.show(error: validationError)
            return
        }
        
        self.startProgressAnimation()
        stateController.update(type: .password) { (code, msg) in
            self.stopProgressAnimation()
            if code != 1 {
                self.show(error: msg)
            } else {
                let alertVC = QuestionAlertVC(message: msg)
                self.present(alertVC, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func btnCancelClicked(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        if sender == textFieldCurrentPass {
            stateController.password = sender.text!
        } else if sender == textFieldNewPass {
            stateController.newPassword = sender.text!
        } else if sender == textFieldRePass {
            stateController.confirmPassword = sender.text!
        }
    }
    
    
    
    
    
}
