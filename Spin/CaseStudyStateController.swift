//
//  CaseStudyStateController.swift
//  Spin
//
//  Created by Mohamed Salah on 3/11/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation
import Alamofire

class CaseStudyStateController {
    //MARK: - Variables
    var posts : [StayUpdatedData] = []
    var filteredPosts : [StayUpdatedData] = []
    
    //MARK:- Init
    
    //MARK: - Filtring
    func filterPosts(withKey search : String) {
        if search == "" {
            filteredPosts = posts
            return
        }
        
        filteredPosts = posts.filter({ (item : StayUpdatedData) -> Bool in
            return item.body.range(of: search) != nil || item.title.range(of: search) != nil
        })
    }
    
    //MARK:- API CALLS
    func getPosts (completion: @escaping (String!) -> Void) {
        let urlString = "\(URLS.server_ip.rawValue)\(URLS.caseStudy.rawValue)"
        
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
                        self.posts = serverResponse.stayUpdatedData
                        self.filteredPosts = serverResponse.stayUpdatedData
                        
                        completion(nil)
                    } else {
                        completion(serverResponse.msg)
                    }
                    
                }
        }
        
    }
}


