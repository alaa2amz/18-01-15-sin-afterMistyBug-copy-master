//
//  ABLAlertViewController.swift
//  Spin
//
//  Created by Mohamed Salah on 1/30/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class ABLAlertViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak open var alertMaskBackground: UIImageView!
    @IBOutlet weak open var alertView: UIView!
    var animator : UIDynamicAnimator?
    
    @IBOutlet weak var labelEBVResult: UILabel!
    @IBOutlet weak var labelABLResult: UILabel!
    
    open var gravityDismissAnimation = true
    
    
    //MARK: - Initialiser
    @objc public convenience init(EBV : String, ABL : String) {
        
        self.init()
        let nib = loadNibAlertController()
        if nib != nil{
            self.view = nib![0] as! UIView
        }
        
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        alertView.layer.cornerRadius = 5
        
        labelEBVResult.text = "\(EBV) mL"
        labelABLResult.text = "\(ABL) mL"
        
        setShadowAlertView()
    }
    
    //MARK: - Actions
    @objc fileprivate func dismissAlertController(_ sender: UIButton){
        self.animateDismissWithGravity(.cancel)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnCloseClicked(_ sender: UIButton) {
        dismissAlertController(sender)
    }
    //MARK: - Customizations
    @objc fileprivate func setShadowAlertView(){
        alertView.layer.masksToBounds = false
        alertView.layer.shadowOffset = CGSize(width: 0, height: 0)
        alertView.layer.shadowRadius = 8
        alertView.layer.shadowOpacity = 0.3
    }
    
    @objc fileprivate func loadNibAlertController() -> [AnyObject]?{
        let podBundle = Bundle(for: self.classForCoder)
        
        if let bundleURL = podBundle.url(forResource: "ABLAlertViewController", withExtension: "bundle"){
            
            if let bundle = Bundle(url: bundleURL) {
                return bundle.loadNibNamed("ABLAlertViewController", owner: self, options: nil) as [AnyObject]?
            }
            else {
                assertionFailure("Could not load the bundle")
            }
            
        }
        else if let nib = podBundle.loadNibNamed("ABLAlertViewController", owner: self, options: nil) as [AnyObject]?{
            return nib
        }
        else{
            assertionFailure("Could not create a path to the bundle")
        }
        return nil
    }
    
    //MARK: - Animations
    
    @objc fileprivate func animateDismissWithGravity(_ style: PMAlertActionStyle){
        if gravityDismissAnimation == true{
            var radian = M_PI
            if style == .default {
                radian = 2 * M_PI
            }else{
                radian = -2 * M_PI
            }
            animator = UIDynamicAnimator(referenceView: self.view)
            
            let gravityBehavior = UIGravityBehavior(items: [alertView])
            gravityBehavior.gravityDirection = CGVector(dx: 0, dy: 10)
            
            animator?.addBehavior(gravityBehavior)
            
            let itemBehavior = UIDynamicItemBehavior(items: [alertView])
            itemBehavior.addAngularVelocity(CGFloat(radian), for: alertView)
            animator?.addBehavior(itemBehavior)
        }
    }
}
