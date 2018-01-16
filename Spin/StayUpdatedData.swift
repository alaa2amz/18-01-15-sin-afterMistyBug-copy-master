//
//	StayUpdatedData.swift
//
//	Create by Mohamed Salah on 8/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class StayUpdatedData : NSObject {
    
    var body : String!
    var iD : String!
    var image : String!
    var link : String!
    var title : String!
    var createdDate : String!
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        body = dictionary["Body"] as? String
        iD = dictionary["ID"] as? String
        
        if let img = dictionary["Image"] as? String {
            image = img
        }
        
        link = dictionary["Link"] as? String
        title = dictionary["Title"] as? String
        createdDate = dictionary["Created"] as? String
    }
    
}
