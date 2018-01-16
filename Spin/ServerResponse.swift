//
//	ServerResponse.swift
//
//	Create by Mohamed Salah on 4/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ServerResponse : NSObject {

	var code : String!
	var data : [AreasData]!
    var loginData : LoginData!
    var stayUpdatedData : [StayUpdatedData]!
    var videosData : [VideoData]!
    var askedQuestions : [AskedQuestion]!
    var eventsData : [EventData]!
    var myCornerData : [MyCornerData]!
    var aboutData : AboutData!
	var msg : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		code = dictionary["code"] as? String
		
		
        if let dataArray = dictionary["data"] as? [NSDictionary]{
            data = [AreasData]()
			for dic in dataArray{
				let value = AreasData(fromDictionary: dic)
				data.append(value)
			}
		}
        
        if let loginDic = dictionary["data"] as? NSDictionary {
            self.loginData = LoginData(fromDictionary: loginDic)
        }
        
        if let aboutDic = dictionary["data"] as? NSDictionary {
            self.aboutData = AboutData(fromDictionary: aboutDic)
        }
        
        if let stayUpdatedDataArray = dictionary["data"] as? [NSDictionary]{
            stayUpdatedData = [StayUpdatedData]()
            for dic in stayUpdatedDataArray{
                let value = StayUpdatedData(fromDictionary: dic)
                stayUpdatedData.append(value)
            }
        }
        
        if let videosDataArray = dictionary["data"] as? [NSDictionary]{
            videosData = [VideoData]()
            for dic in videosDataArray {
                let value = VideoData(fromDictionary: dic)
                videosData.append(value)
            }
        }
        
        if let questionsArray = dictionary["data"] as? [NSDictionary]{
            askedQuestions = [AskedQuestion]()
            for dic in questionsArray{
                let value = AskedQuestion(fromDictionary: dic)
                askedQuestions.append(value)
            }
        }
        
        if let eventsArray = dictionary["data"] as? [NSDictionary]{
            eventsData = [EventData]()
            for dic in eventsArray {
                let value = EventData(fromDictionary: dic)
                eventsData.append(value)
            }
        }
        
        if let cornerArray = dictionary["data"] as? [NSDictionary]{
            myCornerData = [MyCornerData]()
            for dic in cornerArray {
                let value = MyCornerData(fromDictionary: dic)
                myCornerData.append(value)
            }
        }
        
        
        
		msg = dictionary["msg"] as? String
        
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if code != nil{
			dictionary["code"] = code
		}
		if data != nil{
			var dictionaryElements = [NSDictionary]()
			for dataElement in data {
				dictionaryElements.append(dataElement.toDictionary())
			}
			dictionary["data"] = dictionaryElements
		}
		if msg != nil{
			dictionary["msg"] = msg
		}
		return dictionary
	}

}
