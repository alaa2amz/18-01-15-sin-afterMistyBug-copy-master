//
//  SignupViewController.swift
//  Spin
//
//  Created by Mivors on 1/13/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class SignupViewController: BaseViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var textFieldEmail: ACFloatingTextField!
    @IBOutlet weak var textFieldUsername: ACFloatingTextField!
    @IBOutlet weak var textFieldMobile: ACFloatingTextField!
    @IBOutlet weak var textFieldComments: ACFloatingTextField!
    
    
    //MARK:- Variables
    let HOME_SEGUE = "fromSignupToMain"
    var stateController : SignUpStateController!
    
    
    //MARK:- UI Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldComments.isHidden = true
        
        // Do any additional setup after loading the view.
        stateController = SignUpStateController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- IBActions
    @IBAction func btnRegisterClicked(_ sender: UIButton) {
        if let validationError = stateController.validateInputs() {
            self.show(error: validationError)
        } else {
            let alertVC = QuestionAlertVC(message: "Your request is being under process")
            self.present(alertVC, animated: true, completion: nil)
            self.perform(#selector(self.btnCloseClicked(_:)), with: self, afterDelay: 5)
        }
    }
    
    
    @IBAction func btnCloseClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func textFeildChanged(_ sender: ACFloatingTextField) {
        if sender == textFieldEmail {
            stateController.email = textFieldEmail.text!
        } else if sender == textFieldUsername {
            stateController.username = textFieldUsername.text!
        } else if sender == textFieldMobile {
            stateController.mobile = textFieldMobile.text!
        } else if sender == textFieldComments {
            stateController.comments = textFieldComments.text!
        }
        
    }
    

}
