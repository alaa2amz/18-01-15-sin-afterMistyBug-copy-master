//
//  LoginStateController.swift
//  Spin
//
//  Created by Mivors on 1/13/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation
import Alamofire

class LoginStateController {
    //MARK:- Variables
    var delegate = UIApplication.shared.delegate as! AppDelegate
    var isRemmebered : Bool = false
    var username : String = ""
    var password : String = ""
    
    static var userData : LoginData!
    
    //MARK:- Initilization 
    init() {
        self.setUserDataFromStorage()
    }
    
    //MARK:- Validation
    func validateFeilds () -> String? {
        if username.isEmpty || password.isEmpty {
            return ErrorMessages.emptyFeilds.rawValue
        }
        
        return nil
    }
    
    //MARK:- API CALLS
    func loginUser (completion: @escaping (String!) -> Void) {
        let urlString = "\(URLS.server_ip.rawValue)\(URLS.login.rawValue)"
        
        let parameters : Parameters = ["username" : username, "password" : password]
        
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.httpBody)
            .responseJSON { response in
                debugPrint(response)
                
                guard response.result.isSuccess else {
                    completion(ErrorMessages.connectionError.rawValue)
                    return
                }
                
                if let data = response.result.value as? NSDictionary {
                    let serverResponse : ServerResponse = ServerResponse(fromDictionary: data)
                    
                    if serverResponse.code == "1" {
                        LoginStateController.userData = serverResponse.loginData
                        LoginStateController.userData.password = self.password
                        LoginStateController.userData.username = self.username
                        self.delegate.userName = serverResponse.loginData.name!
                        if self.isRemmebered  {
                            LoginStateController.saveUserDefaults()
                        }
                        
                        completion(nil)
                    } else {
                        completion(serverResponse.msg)
                    }
                }
        }
        
    }
    
    //MARK:- Saving & Retriving Data
    static func saveUserDefaults () {
        UserDefaultsHelper.setValue(UserKeys.name.rawValue, value: LoginStateController.userData.name)
        UserDefaultsHelper.setValue(UserKeys.username.rawValue, value: LoginStateController.userData.username)
        
        let photo = LoginStateController.userData.photo == nil ? "" : LoginStateController.userData.photo
        
        UserDefaultsHelper.setValue(UserKeys.photo.rawValue, value: photo!)
        UserDefaultsHelper.setValue(UserKeys.mobile.rawValue, value: LoginStateController.userData.phone)
        UserDefaultsHelper.setValue(UserKeys.email.rawValue, value: LoginStateController.userData.email)
        UserDefaultsHelper.setValue(UserKeys.password.rawValue, value: LoginStateController.userData.password)
        UserDefaultsHelper.setValue(UserKeys.gender.rawValue, value: "\(LoginStateController.userData.gender.rawValue)")
        
    }
    
    func setUserDataFromStorage () {
        let tempPassword = UserDefaultsHelper.getValue(UserKeys.password.rawValue)
        
        if LoginStateController.userData == nil && tempPassword != nil {
            LoginStateController.userData = LoginData()
            
            LoginStateController.userData.name = UserDefaultsHelper.getValue(UserKeys.name.rawValue)
            LoginStateController.userData.photo = UserDefaultsHelper.getValue(UserKeys.photo.rawValue)
            LoginStateController.userData.phone = UserDefaultsHelper.getValue(UserKeys.mobile.rawValue)
            LoginStateController.userData.email = UserDefaultsHelper.getValue(UserKeys.email.rawValue)
            LoginStateController.userData.username = UserDefaultsHelper.getValue(UserKeys.username.rawValue)!
            LoginStateController.userData.password = tempPassword!
            
            if let genderString = UserDefaultsHelper.getValue(UserKeys.gender.rawValue) {
                LoginStateController.userData.gender = GenderTypes(rawValue: Int(genderString)!)
            }
            
            password = tempPassword!
            username = LoginStateController.userData.username
            isRemmebered = true
        }
    }
}
