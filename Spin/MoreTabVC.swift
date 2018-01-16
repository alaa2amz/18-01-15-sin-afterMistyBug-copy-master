//
//  MoreTabVC.swift
//  Spin
//
//  Created by Mohamed Salah on 2/11/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class MoreTabVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Variables
    let CELL_IDENTIFIER = "MoreTableCell"
    let ABOUT_SEGUE = "fromMoreToAbout"
    let VIDEO_SEGUE = "fromMoreToVideos"
    let MYCORNER_SEGUE = "fromMoreToMyCorner"
    let EVENTS_SEGUE = "fromMoreToEvents"
    
    //MARK: - UIViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.tableFooterView = UIView()
        
        configurePageTitle()
    }
    
    //MARK:- Configuratiuon
    func configurePageTitle(){
        let frame : CGRect = CGRect(x: 0, y: 0, width: 100, height: 30)
        let label : UILabel = UILabel(frame: frame)
        
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Nexa Light", size: 22.0)
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        label.text = "More"
        
        self.navigationItem.titleView = label
    }
    
    //MARK: - Table View 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath) as! ImageTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.labelTitle.text = "About Sanofi"
            cell.imageViewImage.image = UIImage(named: "")
            break
        case 1:
            cell.labelTitle.text = "My Corner"
            cell.imageViewImage.image = UIImage(named: "")
            break
        case 2:
            cell.labelTitle.text = "Videos"
            cell.imageViewImage.image = UIImage(named: "")
            break
        case 3:
            cell.labelTitle.text = "News and Events Calender"
            cell.imageViewImage.image = UIImage(named: "")
            break
        default:
            break
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedSegue = ""
        switch indexPath.row {
        case 0:
            selectedSegue = ABOUT_SEGUE
            break
        case 1:
            selectedSegue = MYCORNER_SEGUE
            break
        case 2:
            selectedSegue = VIDEO_SEGUE
            break
        case 3:
            selectedSegue = EVENTS_SEGUE
            break
        default:
            break
        }
        
        self.performSegue(withIdentifier: selectedSegue, sender: self)
    }
}
