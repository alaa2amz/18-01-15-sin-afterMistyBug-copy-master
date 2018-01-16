//
//  UserDefaultsManager.swift
//  AjlanEcommerce
//
//  Created by Mohamed Salah on 5/11/16.
//  Copyright © 2016 Mohamed Salah. All rights reserved.
//

import Foundation


class UserDefaultsHelper {
    class func getValue (_ key : String) -> String? {
        let preferences = UserDefaults.standard
        
        if preferences.object(forKey: key) == nil {
            return nil
        } else {
            return preferences.string(forKey: key)
        }
    }
    
    class func setValue (_ key : String, value : String) {
        let preferences = UserDefaults.standard
        
        preferences.setValue(value, forKey: key)
        
        //  Save to disk
        let _ = preferences.synchronize()
    }
    
    class func removeKey (_ key : String) {
        let preferences = UserDefaults.standard
        preferences.removeObject(forKey: key)
    }

}


enum UserKeys : String {
    case name = "name"
    case email = "email"
    case photo = "photo"
    case mobile = "mobile"
    case password = "password"
    case gender = "gender"
    case username = "username"
}
