//
//  ProfileStateController.swift
//  Spin
//
//  Created by Mohamed Salah on 3/6/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation
import Alamofire

class ProfileStateController {
    //MARK: - Variables
    var firstName: String = ""
    var middleName: String = ""
    var lastName: String = ""
    var currentTitle: String = ""
    
    var password: String = ""
    var newPassword: String = ""
    var confirmPassword: String = ""
    
    //MARK:- Init
    init() {
        firstName    = LoginStateController.userData.name
        middleName   = LoginStateController.userData.name
        lastName     = LoginStateController.userData.name
    }
    
    //MARK: - Validation
    func validate() -> String? {
        var error : String?
        
        if password != LoginStateController.userData.password ||
            newPassword != confirmPassword {
           
            error = "Passwords doesn't match"
        }
        
        return error
    }
    
    //MARK:- API CALLS
    func update (type : UpdateType,
                 completion: @escaping (Int, String) -> Void) {
        
        let urlString = "\(URLS.server_ip.rawValue)\(URLS.updateProfile.rawValue)"
        
        let parameters : Parameters!
        
        if type == .all {
            parameters = [
            "username" : LoginStateController.userData.username,
            "password" : LoginStateController.userData.password,
            "fullname" : "\(firstName) \(middleName) \(lastName)",
            "title"    : currentTitle
            ]
        } else {
            parameters = [
            "username" : LoginStateController.userData.username,
            "password" : LoginStateController.userData.password,
            "newPassword" : newPassword
            ]
        }
        
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.httpBody)
            .responseJSON { response in
                
                guard response.result.isSuccess else {
                    completion(0, ErrorMessages.connectionError.rawValue)
                    return
                }
                
                if let data = response.result.value as? NSDictionary {
                    let serverResponse : ServerResponse = ServerResponse(fromDictionary: data)
                    
                    if serverResponse.code == "1" {
                        completion(1, serverResponse.msg)
                    } else {
                        completion(0, serverResponse.msg)
                    }
                    
                }
        }
        
    }
    
}

enum UpdateType {
    case all
    case password
}
