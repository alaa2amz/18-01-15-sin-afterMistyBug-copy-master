//
//  NewsletterTableHandler.swift
//  Spin
//
//  Created by Mohamed Salah on 2/25/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class NewsletterTableHandler: NSObject, UITableViewDelegate, UITableViewDataSource {
    //MARK:- Variables
    var stateController : NewsletterStateController!
    var delegate : WebDelegate!
    let CELL_IDENTIFIER = "NewsletterCell"
    
    
    //MARK:- Init
    init(stateCtrl : NewsletterStateController, webViewDelegate : WebDelegate) {
        self.stateController = stateCtrl
        self.delegate = webViewDelegate
    }
    
    
    //MARK:- DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateController.newsletter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath) as! NewsletterTVC
        
        let currentNewsletter = stateController.newsletter[indexPath.row]
        
        let url = URL(string: currentNewsletter.image)
        cell.imageViewNewsletter.hnk_setImageFromURL(url!)
        
        cell.labelTitle.text = currentNewsletter.title
        cell.labelDetails.text = currentNewsletter.body
        cell.labelTime.text = currentNewsletter.created
        
        cell.labelShared.text = ""
        cell.labelNew.text = ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentNewsletter = stateController.newsletter[indexPath.row]
        delegate.startWebView(url: currentNewsletter.link)
    }
}
