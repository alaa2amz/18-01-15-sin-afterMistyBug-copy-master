//
//  StayUpdatedViewController.swift
//  Spin
//
//  Created by Mohamed Salah on 1/30/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class StayUpdatedViewController: BaseViewController, WebDelegate {
    //MARK:- IBOutlets
    
    @IBOutlet weak var textFieldSearch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK:- Variables
    var stateController : StayUpdatedStateController!
    var tableDataSource : UpdatesTableDataSource!
    
    //MARK:- UI Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configurePageTitle()
        
        stateController = StayUpdatedStateController()
        tableDataSource = UpdatesTableDataSource(stateController: stateController,
                                                 delegate: self)
        
        self.tableView.dataSource = tableDataSource
        self.tableView.isHidden = true
        self.tableView.tableFooterView = UIView()
        
        stateController.getPosts { (error) in
            self.activityIndicator.stopAnimating()
            if error != nil {
                self.show(error: error)
            } else {
                self.tableView.isHidden = false
                self.tableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Configuratiuon
    func configurePageTitle(){
        let frame : CGRect = CGRect(x: 0, y: 0, width: 100, height: 30)
        let label : UILabel = UILabel(frame: frame)
        
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Nexa Light", size: 22.0)
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        label.text = "Stay Updated"
        
        self.navigationItem.titleView = label
    }
    
    //MARK:- Web Delegate
    func startWebView (url : String) {
        self.showWebView(url: url)
    }
    
    
    //MARK:- IBActions

    @IBAction func btnCancelSearchClicked(_ sender: UIButton) {
        self.textFieldSearch.text = ""
        textFieldSearchChanged(textFieldSearch)
    }
    
    @IBAction func textFieldSearchChanged(_ sender: UITextField) {
        stateController.filterPosts(withKey: sender.text!)
        self.tableView.reloadData()
    }
}
