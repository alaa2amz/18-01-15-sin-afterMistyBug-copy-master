//
//	Tip.swift
//
//	Create by Mohamed Salah on 25/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class Tip{
    
    var body : String!
    var iD : String!
    var title : String!
    var views : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        body = dictionary["Body"] as? String
        iD = dictionary["ID"] as? String
        title = dictionary["Title"] as? String
        views = dictionary["Views"] as? String
    }
    
}
