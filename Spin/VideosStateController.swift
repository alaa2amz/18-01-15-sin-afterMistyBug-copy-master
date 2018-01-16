//
//  VideosStateController.swift
//  Spin
//
//  Created by Mohamed Salah on 2/12/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation
import Alamofire

class VideosStateController {
    //MARK: - Variables
    var videos : [VideoData] = []
    var filteredVideos : [VideoData] = []
    
    //MARK:- Init
    
    //MARK: - Filtring
    func filterVideos (withKey search : String) {
        if search == "" {
            filteredVideos = videos
            return
        }
        
        filteredVideos = videos.filter({ (item : VideoData) -> Bool in
            return item.body.range(of: search) != nil || item.title.range(of: search) != nil
        })
    }
    
    //MARK:- API CALLS
    func getVideos (completion: @escaping (String!) -> Void) {
        let urlString = "\(URLS.server_ip.rawValue)\(URLS.videos.rawValue)"
        
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
                        self.videos = serverResponse.videosData
                        self.filteredVideos = serverResponse.videosData
                        
                        completion(nil)
                    } else {
                        completion(serverResponse.msg)
                    }
                    
                }
        }
        
    }
}
