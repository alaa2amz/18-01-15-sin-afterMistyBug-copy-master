//
//	EventData.swift
//
//	Create by Mohamed Salah on 12/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class EventData : NSObject {
    
    
    var iD : String!
    var title : String!
    var body : String!
    var image : String!
    var link : String!
    var eventDate : String!
    var created : String!
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        body = dictionary["Body"] as? String
        created = dictionary["Created"] as? String
        eventDate = dictionary["EventDate"] as? String        
        iD = dictionary["ID"] as? String
        link = dictionary["Link"] as? String
        image = dictionary["Image"] as? String
        title = dictionary["Title"] as? String
    }
}
