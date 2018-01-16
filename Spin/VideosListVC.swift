//
//  VideosListVC.swift
//  Spin
//
//  Created by Mohamed Salah on 2/12/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit
import DZNWebViewController

class VideosListVC: BaseViewController, WebDelegate {
    //MARK:- IBOutlets
    
    @IBOutlet weak var textFieldSearch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK:- Variables
    var stateController : VideosStateController!
    var tableDataSource : VideosListDataSource!
    
    
    //MARK:- UI Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configurePageTitle()
        
        stateController = VideosStateController()
        tableDataSource = VideosListDataSource(stateController: stateController, delegate: self)
        
        self.tableView.dataSource = tableDataSource
        self.tableView.isHidden = true
        self.tableView.tableFooterView = UIView()
        
        stateController.getVideos { (error) in
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
        label.text = "Video Conference"
        
        self.navigationItem.titleView = label
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func startWebView (url : String) {
        self.showWebView(url: url)
    }
    
    //MARK:- IBActions
    @IBAction func btnCancelSearchClicked(_ sender: UIButton) {
        self.textFieldSearch.text = ""
        textFieldSearchChanged(textFieldSearch)
    }
    
    
    
    @IBAction func textFieldSearchChanged(_ sender: UITextField) {
        stateController.filterVideos(withKey: sender.text!)
        self.tableView.reloadData()
    }
}
