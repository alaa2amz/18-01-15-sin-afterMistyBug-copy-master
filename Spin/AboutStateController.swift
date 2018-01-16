//
//  AboutStateController.swift
//  Spin
//
//  Created by Mohamed Salah on 2/10/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation
import Alamofire

class AboutStateController {
    //MARK: - Variables
    var aboutData : AboutData!
    
    //MARK:- Init
    
    //MARK:- API CALLS
    func getInfo (completion: @escaping (String!) -> Void) {
        let urlString = "\(URLS.server_ip.rawValue)\(URLS.about.rawValue)"
        
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
                    let serverResponse : ServerResponse = ServerResponse(fromDictionary: data)
                    
                    if serverResponse.code == "1" {
                        self.aboutData = serverResponse.aboutData
                        completion(nil)
                    } else {
                        completion(serverResponse.msg)
                    }
                    
                }
        }
    }
}
