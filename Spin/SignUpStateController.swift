//
//  SignUpStateController.swift
//  Spin
//
//  Created by Mohamed Salah on 2/4/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation
import Alamofire

class SignUpStateController {
    //MARK:- Variables 
    var username : String = ""
    var email : String = ""
    var mobile: String = ""
    var comments: String = ""
    
    //MARK:- init

    
    //MARK:- Validation
    func validateInputs () -> String? {
        if username.isEmpty || email.isEmpty
            || mobile.isEmpty || comments.isEmpty
        {
            return ErrorMessages.emptyFeilds.rawValue
        }
        
        if !email.isEmail() {
            return ErrorMessages.invalidEmail.rawValue
        }
        
        return nil
    }
    
    //MARK:- API Call
    
}
