//
//  AboutData.swift
//  Spin
//
//  Created by Mohamed Salah on 2/11/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation

class AboutData : NSObject {
    
    var body : String!
    var title : String!
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        body = dictionary["Body"] as? String
        title = dictionary["Title"] as? String
    }
    
}
