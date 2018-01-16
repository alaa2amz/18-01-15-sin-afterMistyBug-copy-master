//
//  MyCornerVC.swift
//  Spin
//
//  Created by Mohamed Salah on 2/14/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit
//import ExpandableCell
 

class MyCornerVC: BaseViewController,CollapsibleTableViewHeaderDelegate,UITableViewDelegate,UITableViewDataSource {
    
    
    //MARK:- IBOutlets
 
    @IBOutlet weak var collapisableTable : UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var btnArea1: UIButton!
    @IBOutlet weak var btnArea2: UIButton!
    @IBOutlet weak var btnArea3: UIButton!
    @IBOutlet weak var btnArea4: UIButton!
    
    @IBOutlet weak var viewNotifications: UIView!
    //MARK:- Variables
    var myCornerStateCtrl : MyCornerStateController!
    var tableHandler : TipsTableHandler!
    var isCollappsed :[Bool] = [true,true,true,true,true,true,true,true]
       let headerCell = CollapsibleTableViewHeader(reuseIdentifier: "header")
    //MARK: table methods
    //MARK: tables functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableHandler.stateController.myCornerData.count
    }
    
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !isCollappsed[section]
        
        // Toggle collapse
        isCollappsed[section] = collapsed
        header.setCollapsed(collapsed)
        
        // Reload the whole section
        collapisableTable.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        
        header.titleLabel.text = self.tableHandler.stateController.myCornerData[section].corner
         header.titleLabel.textColor = UIColor.blue
        header.arrowLabel.text = "▶"
        header.arrowLabel.textColor = UIColor.orange
        header.setCollapsed(isCollappsed[section])
        
        header.section = section
        header.delegate = self
        header.borderColor = UIColor.white
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isCollappsed[section] ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =   collapisableTable.dequeueReusableCell(withIdentifier: "cell") as? CornerCell
        cell?.label?.text = self.tableHandler.stateController.myCornerData[indexPath.section].tips[0].body
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    

    //MARK:- UI Methods
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //MARK: delegation & datasources
       
        // Auto resizing the height of the cell
        collapisableTable.estimatedRowHeight = 44.0
        collapisableTable.rowHeight = UITableViewAutomaticDimension
        
        // Do any additional setup after loading the view.
        configurePageTitle()
        
        //self.tableView.tableFooterView = UIView()
        self.viewNotifications.isHidden = true
        
        btnArea1.isHidden = true
        btnArea2.isHidden = true
        btnArea3.isHidden = true
        btnArea4.isHidden = true
        
        myCornerStateCtrl = MyCornerStateController()
        myCornerStateCtrl.getTips { (error) in
            self.activityIndicator.stopAnimating()
            if error != nil {
                self.show(error: error)
            } else {
                self.handleServerData()
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
        label.text = "My Corner"
        
        self.navigationItem.titleView = label
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func handleServerData () {
        self.tableHandler = TipsTableHandler(stateCtrl: self.myCornerStateCtrl)
        self.collapisableTable.dataSource = self.tableHandler
        //self.tableView.delegate = self
        
        collapisableTable.dataSource = self
        collapisableTable.delegate = self
        self.collapisableTable.reloadData()
        
        var hiddenArray : [Bool]!
        switch myCornerStateCtrl.myCornerData.count {
        case 0:
            hiddenArray = [false,false,false,false]
            break
        case 1:
            hiddenArray = [true,false,false,false]
            btnArea1.setTitle(myCornerStateCtrl.myCornerData[0].corner, for: .normal)
            break
        case 2:
            hiddenArray = [true,true,false,false]
            btnArea1.setTitle(myCornerStateCtrl.myCornerData[0].corner, for: .normal)
            btnArea2.setTitle(myCornerStateCtrl.myCornerData[1].corner, for: .normal)
            break
        case 3:
            hiddenArray = [true,true,true,false]
            btnArea1.setTitle(myCornerStateCtrl.myCornerData[0].corner, for: .normal)
            btnArea2.setTitle(myCornerStateCtrl.myCornerData[1].corner, for: .normal)
            btnArea3.setTitle(myCornerStateCtrl.myCornerData[2].corner, for: .normal)
            
            break
        case 4:
            hiddenArray = [true,true,true,true]
            btnArea1.setTitle(myCornerStateCtrl.myCornerData[0].corner, for: .normal)
            btnArea2.setTitle(myCornerStateCtrl.myCornerData[1].corner, for: .normal)
            btnArea3.setTitle(myCornerStateCtrl.myCornerData[2].corner, for: .normal)
            btnArea4.setTitle(myCornerStateCtrl.myCornerData[3].corner, for: .normal)
            break
        default:
            break
        }
        
        btnArea1.isHidden = !hiddenArray[0]
        btnArea2.isHidden = !hiddenArray[1]
        btnArea3.isHidden = !hiddenArray[2]
        btnArea4.isHidden = !hiddenArray[3]
        
        btnArea1.backgroundColor = AppColors.selectedTab
    }
    
    //MARK:- IBActions
    @IBAction func btnAreaClicked(_ sender: UIButton) {
        var colorsArray : [UIColor]!
        
        if sender == btnArea1 {
            myCornerStateCtrl.selectedCornerIndex = 0
            colorsArray = [AppColors.selectedTab, AppColors.tab, AppColors.tab, AppColors.tab]
        } else if sender == btnArea2 {
            myCornerStateCtrl.selectedCornerIndex = 1
            colorsArray = [AppColors.tab, AppColors.selectedTab, AppColors.tab, AppColors.tab]
        } else if sender == btnArea3 {
            myCornerStateCtrl.selectedCornerIndex = 2
            colorsArray = [AppColors.tab, AppColors.tab, AppColors.selectedTab, AppColors.tab]
        }
        else {
            myCornerStateCtrl.selectedCornerIndex = 3
            colorsArray = [AppColors.tab, AppColors.tab, AppColors.tab, AppColors.selectedTab,]
        }
        
        
        btnArea1.backgroundColor = colorsArray[0]
        btnArea2.backgroundColor = colorsArray[1]
        btnArea3.backgroundColor = colorsArray[2]
        btnArea4.backgroundColor = colorsArray[3]
        
        self.collapisableTable.reloadData()
    }
    

}
