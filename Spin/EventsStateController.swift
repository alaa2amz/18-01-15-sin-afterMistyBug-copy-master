//
//  EventsStateController.swift
//  Spin
//
//  Created by Mohamed Salah on 2/23/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation
import Alamofire

class EventsStateController {
    //MARK: - Variables
    var events : [EventData] = []
    
    let formatter = DateFormatter()
    //MARK:- Init
    
    //MARK: - Filtring
    func isEventDate(date : Date) -> Int {
        formatter.dateFormat = "dd-MM-yyyy hh:mm:ss"
        var dateString = formatter.string(from: date)
        
        let index = dateString.index(dateString.startIndex, offsetBy: 10)
        dateString = dateString.substring(to: index)
        
        var i = 0
        
        for event in events where event.eventDate.characters.count >= 10 {
            let eventIndex = event.eventDate.index(event.eventDate.startIndex, offsetBy: 10)
            event.eventDate = event.eventDate.substring(to: eventIndex)
            
            if event.eventDate! == dateString {
                return i
            }
            
            i += 1
        }
        
        return -1
    }
    
    //MARK:- API CALLS
    func getEvents (completion: @escaping (String!) -> Void) {
        let urlString = "\(URLS.server_ip.rawValue)\(URLS.events.rawValue)"
        
        let parameters : Parameters = [
            "username" : LoginStateController.userData.username,
            "password" : LoginStateController.userData.password,
            ]
        
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.httpBody)
            .responseJSON { response in
                
                guard response.result.isSuccess else {
                    completion(ErrorMessages.connectionError.rawValue)
                    return
                }
                
                if let data = response.result.value as? NSDictionary {
                   print("----|||----")
                    print(response.result.value)
                    
                    let serverResponse : ServerResponse = ServerResponse(fromDictionary: data)
                    
                    if serverResponse.code == "1" {
                        self.events = serverResponse.eventsData
                        
                        completion(nil)
                    } else {
                        completion(serverResponse.msg)
                    }
                    
                }
        }
        
    }
}
