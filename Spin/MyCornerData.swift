//
//	MyCornerData.swift
//
//	Create by Mohamed Salah on 25/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class MyCornerData {
    
    var corner : String!
    var tips : [Tip]!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        corner = dictionary["Corner"] as? String
        tips = [Tip]()
        if let tipsArray = dictionary["Tips"] as? [NSDictionary]{
            for dic in tipsArray{
                let value = Tip(fromDictionary: dic)
                tips.append(value)
            }
        }
    }
    
}
