//
//  LoginData.swift
//  Spin
//
//  Created by Mohamed Salah on 2/6/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation

class LoginData : NSObject {
    
    var email : String!
    var name : String!
    var phone : String!
    var photo : String!
    var password : String = ""
    var gender : GenderTypes!
    var username: String = ""
    
    override init() {
        super.init()
        email = ""
        name = ""
        phone = ""
        phone = ""
    }
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        email = dictionary["Email"] as? String
        name = dictionary["Name"] as? String
        phone = dictionary["Phone"] as? String
        photo = dictionary["Photo"] as? String
        
        if let genderDicValue = dictionary["Gender"] as? String {
            if let gender = Int(genderDicValue) {
                self.gender = GenderTypes(rawValue: gender)
            }
        }
    }

}


