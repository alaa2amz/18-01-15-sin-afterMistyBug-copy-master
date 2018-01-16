//
//  VTECalculatorViewController.swift
//  Spin
//
//  Created by Mohamed Salah on 1/28/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class VTECalculatorViewController: UITableViewController, CalculateDelegate {
    //MARK:- IBOutlets
    @IBOutlet weak var labelSecondTitle: UILabel!
    
    //MARK:- Variables 
    var stateController : VTEStateController!
    var tableDataSource : VTETableDataSource!
    var tableDelgate    : VTETableDelegate!
    
    //MARK:- UI Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.configurePageTitle()
        
        
        stateController = VTEStateController(delegate: self)
        tableDelgate = VTETableDelegate(stateController: stateController)
        tableDataSource = VTETableDataSource(stateController: stateController)
        
        self.tableView.dataSource = tableDataSource
        self.tableView.delegate = tableDelgate
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        VTEStateController.total = 0
    }
    
    //MARK:- Configuratiuon
    func configurePageTitle(){
        let frame : CGRect = CGRect(x: 0, y: 0, width: 100, height: 30)
        let label : UILabel = UILabel(frame: frame)
        
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Nexa Light", size: 22.0)
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.autoresizingMask = .flexibleWidth
        // in calculator itself
        label.text = "VTE risk assesment"
        
        self.navigationItem.titleView = label
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_refresh"), style: .plain, target: self, action: #selector(btnRefreshTapped(_:)))
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func calculateDidTapped() {
        let vc = AlertViewController(title: "")
        self.present(vc, animated: true, completion: nil)
    }
    
    func btnRefreshTapped(_ sender: UIBarButtonItem) {
        stateController.reloadData()
        tableView.reloadData()
    }
}

protocol CalculateDelegate {
    func calculateDidTapped()
}
