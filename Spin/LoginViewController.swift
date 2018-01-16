//
//  LoginViewController.swift
//  Spin
//
//  Created by Mivors on 1/13/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var textFieldEmail: ACFloatingTextField!
    @IBOutlet weak var textFieldPassword: ACFloatingTextField!
    
    @IBOutlet weak var btnRememberMe: UIButton!
    
    //MARK:- Variables
    let HOME_SEGUE = "fromLoginToMain"
    var stateController : LoginStateController!
    
    //MARK:- UI Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        stateController = LoginStateController()
        
        textFieldPassword.text = stateController.password
        textFieldEmail.text = stateController.username
        
        if stateController.isRemmebered {
            btnRememberMe.setImage(UIImage(named: "ic_check_selected"), for: .normal)
        } else {
            btnRememberMe.setImage(UIImage(named: "ic_check"), for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- IBActions
    @IBAction func btnLoginClicked(_ sender: Any) {
        if let error = stateController.validateFeilds() {
            self.show(error: error)
        } else {
            self.startProgressAnimation()
            stateController.loginUser { (error) in
                self.stopProgressAnimation()
                if error != nil {
                    self.show(error: error)
                } else {
                    self.performSegue(withIdentifier: self.HOME_SEGUE, sender: self)
                }
            }
        }
    }
    
    @IBAction func btnRemmberMeClicked(_ sender: UIButton) {
        stateController.isRemmebered = !stateController.isRemmebered
        
        switch stateController.isRemmebered {
        
        case true:
            btnRememberMe.setImage(UIImage(named: "ic_check_selected"), for: .normal)
            break
        case false:
            btnRememberMe.setImage(UIImage(named: "ic_check"), for: .normal)
            break
        }
        
    }
    
    @IBAction func btnForgetPasswordClicked(_ sender: UIButton) {
        
    }
    
    
    @IBAction func textFieldsChanged(_ sender: ACFloatingTextField) {
        switch sender {
        case textFieldEmail:
            stateController.username = textFieldEmail.text!
        default:
            stateController.password = textFieldPassword.text!
        }
    }

}
