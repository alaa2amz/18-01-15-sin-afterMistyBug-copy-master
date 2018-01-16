//
//  SideMenuTableViewController.swift
//  Spin
//
//  Created by Mohamed Salah on 2/3/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuTableViewController: UITableViewController {
    //MARK: - variables
    let delegate = UIApplication.shared.delegate as! AppDelegate
    let profileCellIdentifier = "ProfileCell"
    let optionCellIdentifier = "OptionsCell"
    let HOME_SEGUE = "fromTabBarToHome"
    
    @IBOutlet weak var userName: UILabel!
    var viewControllerForPresentedMenu: UIViewController? {
        get {
            return SideMenuManager.menuLeftNavigationController?.presentingViewController != nil ? SideMenuManager.menuLeftNavigationController?.presentingViewController : SideMenuManager.menuRightNavigationController?.presentingViewController
        }
    }
    
    // MARK: - UI Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
      
        userName.text = delegate.userName
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            break
        case 1:
            self.start(newPage: "HomeViewController", storyboardName: "Main", transaction: .transitionFlipFromLeft)
            break
        case 2:
            self.start(newPage: "StayUpdatedNVC", storyboardName: "Tabs", transaction: .beginFromCurrentState)
            break
        case 3:
            self.start(newPage: "CalcsNVC", storyboardName: "Tabs", transaction: .beginFromCurrentState)
            break
        case 4:
            self.start(newPage: "ECMENVC", storyboardName: "Tabs", transaction: .beginFromCurrentState)
            break
        case 5:
            self.start(newPage: "CaseStudyNVC", storyboardName: "Tabs", transaction: .beginFromCurrentState)
            break
        case 9:
            self.start(newPage: "AboutNVC", storyboardName: "Tabs", transaction: .beginFromCurrentState)
            break
        case 6:
            self.start(newPage: "CornerNVC", storyboardName: "Tabs", transaction: .beginFromCurrentState)
            break
        case 7:
            self.start(newPage: "VideosNVC", storyboardName: "Tabs", transaction: .beginFromCurrentState)
            break
        case 8:
            self.start(newPage: "EventsNVC", storyboardName: "Tabs", transaction: .beginFromCurrentState)
            break
        case 10:
            self.start(newPage: "SettingsNVC", storyboardName: "Tabs", transaction: .beginFromCurrentState)
            break
        case 11:
            self.start(newPage: "logOnVC", storyboardName: "Main", transaction: .beginFromCurrentState)
            print("logout")
            break
        default:
            break
        }
        
        
    }
    
    //MARK:- TRANSACTION
    func start(newPage id: String, storyboardName: String, transaction: UIViewAnimationOptions) {
        
        self.viewControllerForPresentedMenu?.dismiss(animated: false, completion: nil)
        
        let window = (UIApplication.shared.delegate as! AppDelegate).window
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        window?.rootViewController = storyboard.instantiateViewController(withIdentifier: id)
        
        UIView.transition(with: window!, duration: 0.5, options: transaction, animations: nil, completion: nil)
        
    }

}
