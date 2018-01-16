//
//  AskedQuestion.swift
//  Spin
//
//  Created by Mohamed Salah on 2/10/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation

class AskedQuestion : NSObject {
    
    var iD : String!
    var question : String!
    var answer : String!
    var createdDate : String!
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        iD = dictionary["ID"] as? String
        question = dictionary["Question"] as? String
        answer = dictionary["Answer"] as? String
        createdDate = dictionary["Created"] as? String
    }
    
}
