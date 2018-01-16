//
//  EventsTableDataSource.swift
//  Spin
//
//  Created by Mohamed Salah on 2/25/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class EventsTableDataSource : NSObject, UITableViewDataSource, UITableViewDelegate {
    //MARK:- Variables 
    var stateController : EventsStateController!
    var delegate : WebDelegate!
    let CELL_IDENTIFIER = "EventsCell"
    
    
    //MARK:- Init
    init(stateCtrl : EventsStateController, webViewDelegate : WebDelegate) {
        self.stateController = stateCtrl
        self.delegate = webViewDelegate
    }
    
    
    //MARK:- DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateController.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath) as! EventsTVC
        
        let currentEvent = stateController.events[indexPath.row]
        
        let url = URL(string: currentEvent.image)
        cell.imageViewEvent.hnk_setImageFromURL(url!)
        
        cell.labelName.text = currentEvent.title
        cell.labelDetails.text = currentEvent.body
        cell.labelDate.text = currentEvent.eventDate
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentEvent = stateController.events[indexPath.row]
        delegate.startWebView(url: currentEvent.link)
    }
    
    
}
