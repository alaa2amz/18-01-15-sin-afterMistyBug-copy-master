//
//  VideosListDataSource.swift
//  Spin
//
//  Created by Mohamed Salah on 2/12/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation

class VideosListDataSource : NSObject, UITableViewDataSource {
    //MARK: - Variables
    let CELL_IDENTIFIER = "VideoCell"
    var stateController : VideosStateController!
    var delegate: WebDelegate!

    //MARK: - Init
    init(stateController : VideosStateController, delegate: WebDelegate) {
        self.stateController = stateController
        self.delegate = delegate
    }

    //MARK: - Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateController.filteredVideos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath) as! VideoTableViewCell
        
        let currentVideo = stateController.filteredVideos[indexPath.row]
        cell.labelTitle.text = currentVideo.title
        cell.labelBody.text = currentVideo.body
        cell.labelDate.text = currentVideo.created
        cell.link = currentVideo.link
        
        let url = URL(string: currentVideo.thumb)!
        cell.imageViewPic.hnk_setImageFromURL(url)
        
        cell.labelLive.isHidden = true
        cell.delegate = delegate
        
        return cell
    }
    
    
}
