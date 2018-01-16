//
//  CaseStudiesDataSource.swift
//  Spin
//
//  Created by Mohamed Salah on 3/11/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class CaseStudiesDataSource : NSObject, UITableViewDataSource {
    //MARK: - Variables
    let CELL_IDENTIFIER = "CaseStudyCell"
    var stateController : CaseStudyStateController!
    var webDelegate: WebDelegate!
    
    //MARK: - Init
    init(stateController : CaseStudyStateController, webDelegate: WebDelegate) {
        self.stateController = stateController
        self.webDelegate = webDelegate
    }
    
    //MARK: - Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateController.filteredPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath) as! CaseStudyCell
        
        let currentPost = stateController.filteredPosts[indexPath.row]
        cell.labelTitle.text = currentPost.title
        cell.labelBody.text = currentPost.body
        cell.link = currentPost.link!
        
        cell.webDelegate = self.webDelegate
        
        return cell
    }
    
    
}
