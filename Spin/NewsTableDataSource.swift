//
//  NewsTableDataSource.swift
//  Spin
//
//  Created by Mohamed Salah on 2/10/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class NewsTableDataSource: NSObject, UITableViewDataSource {
    
    //MARK: - Variables
    let CELL_IDENTIFIER = "NewsCell"
    var stateController : NewsStateController!
    
    //MARK: - Init
    init(stateController : NewsStateController) {
        self.stateController = stateController
    }
    
    //MARK: - Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateController.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath) as! NewsTableViewCell
        
        let currentPost = stateController.posts[indexPath.row]
        cell.labelTitle.text = currentPost.title
        cell.labelBody.text = currentPost.body
        cell.labelDate.text = currentPost.createdDate
        
        let url = URL(string: currentPost.image)!
        cell.imageViewPic.hnk_setImageFromURL(url)
        
        return cell
    }
}
