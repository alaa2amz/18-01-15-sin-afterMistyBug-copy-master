//
//  EcmeDataSource.swift
//  Spin
//
//  Created by Mohamed Salah on 3/11/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class EcmeDataSource : NSObject, UITableViewDataSource {
    //MARK: - Variables
    let CELL_IDENTIFIER = "EcmeTableCell"
    var stateController : EcmeStateController!
    var webDelegate: WebDelegate!
    
    //MARK: - Init
    init(stateController : EcmeStateController, webDelegate: WebDelegate) {
        self.stateController = stateController
        self.webDelegate = webDelegate
    }
    
    //MARK: - Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateController.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath) as! EcmeTVC
        
        let currentPost = stateController.posts[indexPath.row]
        cell.labelTitle.text = currentPost.title
        cell.labelBody.text = currentPost.body
        cell.link = currentPost.link
        
        let url = URL(string: currentPost.image)!
        cell.imageCourse.hnk_setImageFromURL(url)
        
        cell.webDelegate = self.webDelegate
        
        return cell
    }
    
    
}
