//
//  DropdownViewController.swift
//  Dropdown
//
//  Created by Mohamed Salah on 2/4/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

enum SelectionType {
    case multiple
    case single
}

class DropdownViewController: UIViewController, UIGestureRecognizerDelegate {
    // MARK: Properties
    @IBOutlet weak open var alertMaskBackground: UIImageView!
    @IBOutlet weak open var alertView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK:- Variables 
    var tableDataSource : DropTableViewDataSource!
    var tableDelegate : DropTableViewDelegate!
    var delegate : DropdownDelegate!
    var stateController : DropdownStateController!
    var selectionType : SelectionType = .multiple
    
    var CELL_ID = "DropTableViewCell"
    
    var animator : UIDynamicAnimator?
    open var gravityDismissAnimation = true
    
    
    //MARK: - Initialiser
    convenience init(frame : CGRect, items : [DropdownItem], delegate : DropdownDelegate) {
        
        self.init()
        let nib = loadNibAlertController()
        if nib != nil{
            self.view = nib![0] as! UIView
        }
        
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        self.setupViews(frame : frame, itemsCount: items.count)
        
        tableView.register(UINib(nibName: CELL_ID, bundle: nil), forCellReuseIdentifier: CELL_ID)
        
        stateController = DropdownStateController(items: items)
        
        tableDataSource = DropTableViewDataSource(stateController: stateController)
        tableDelegate = DropTableViewDelegate(self, stateController: stateController, delegate : delegate)
        
        self.tableView.delegate = tableDelegate
        self.tableView.dataSource = tableDataSource
        
    }
    
    func setupViews (frame : CGRect, itemsCount : Int) {
        alertView.frame = CGRect(x: frame.origin.x, y: frame.origin.y + frame.size.height, width: frame.size.width, height: CGFloat(44.0 * Double(itemsCount)))
        tableView.frame = CGRect(x: 0.0, y: 0.0, width: alertView.frame.width, height: alertView.frame.height)
        
        self.tableView.tableFooterView = UIView()
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTouchOutSide(_:)))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
        
        setShadowAlertView()
    }
    
    //MARK: - Actions
    @objc fileprivate func dismissAlertController(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }

    func didTouchOutSide (_ sender: UITapGestureRecognizer) {
        dismissAlertController(UIButton())
    }
    
    //MARK: - Customizations
    @objc fileprivate func setShadowAlertView(){
        alertView.layer.masksToBounds = false
        alertView.layer.shadowOffset = CGSize(width: 0, height: 0)
        alertView.layer.shadowRadius = 8
        alertView.layer.shadowOpacity = 0.1
    }
    
    @objc fileprivate func loadNibAlertController() -> [AnyObject]?{
        let podBundle = Bundle(for: self.classForCoder)
        
        if let bundleURL = podBundle.url(forResource: "DropdownViewController", withExtension: "bundle"){
            
            if let bundle = Bundle(url: bundleURL) {
                return bundle.loadNibNamed("DropdownViewController", owner: self, options: nil) as [AnyObject]?
            }
            else {
                assertionFailure("Could not load the bundle")
            }
            
        }
        else if let nib = podBundle.loadNibNamed("DropdownViewController", owner: self, options: nil) as [AnyObject]?{
            return nib
        }
        else{
            assertionFailure("Could not create a path to the bundle")
        }
        return nil
    }
    
    //MARK:- UIGestureRecognizerDelegate
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: alertView))! {
            return false;
        }
        return true;
    }
    
}
