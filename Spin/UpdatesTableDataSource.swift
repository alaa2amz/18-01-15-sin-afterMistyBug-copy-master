//
//  UpdatesTableDataSource.swift
//  Spin
//
//  Created by Mohamed Salah on 2/10/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class UpdatesTableDataSource : NSObject, UITableViewDataSource {
    //MARK: - Variables
    let CELL_IDENTIFIER = "StayUpdatedCell"
    var stateController : StayUpdatedStateController!
    var delegate: WebDelegate!
    
    //MARK: - Init 
    init(stateController : StayUpdatedStateController, delegate: WebDelegate) {
        self.stateController = stateController
        self.delegate = delegate
    }
    
    //MARK: - Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateController.filteredPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath) as! UpdateTableViewCell
        
        let currentPost = stateController.filteredPosts[indexPath.row]
        cell.labelTitle.text = currentPost.title
        cell.labelBody.text = currentPost.body
        
        cell.labelDate.text? = String(currentPost.createdDate.components(separatedBy: " ")[0])
        
        let url = URL(string: currentPost.image)!
        cell.imageViewPic.hnk_setImageFromURL(url)
        
        cell.link = currentPost.link
        cell.delegate = delegate
        
        return cell
    }
    
    
}
