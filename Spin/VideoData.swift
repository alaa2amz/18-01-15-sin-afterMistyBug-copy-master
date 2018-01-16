//
//	VideoData.swift
//
//	Create by Mohamed Salah on 12/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class VideoData : NSObject {
    
    var body : String!
    var created : String!
    var iD : String!
    var link : String!
    var thumb : String!
    var title : String!
    var views : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        body = dictionary["Body"] as? String
        created = dictionary["Created"] as? String
        iD = dictionary["ID"] as? String
        link = dictionary["Link"] as? String
        thumb = dictionary["Thumb"] as? String
        title = dictionary["Title"] as? String
        views = dictionary["Views"] as? String
    }
}
