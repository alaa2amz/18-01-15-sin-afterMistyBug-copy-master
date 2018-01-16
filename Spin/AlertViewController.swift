//
//  AlertViewController.swift
//  Spin
//
//  Created by Mivors on 1/13/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

@objc open class AlertViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak open var alertMaskBackground: UIImageView!
    @IBOutlet weak open var alertView: UIView!
    
    @IBOutlet weak var resultPartOne: UIImageView!
    @IBOutlet weak var resultPartTwo: UIImageView!
    @IBOutlet weak var resultPartOneHeight: NSLayoutConstraint!
    
    
    var animator : UIDynamicAnimator?
    
    open var gravityDismissAnimation = true
    
    
    //MARK: - Initialiser
    @objc public convenience init(title: String) {
        self.init()
        let nib = loadNibAlertController()
        if nib != nil{
            self.view = nib![0] as! UIView
        }
        
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        alertView.layer.cornerRadius = 5

        if VTEStateController.total >= 4
            && VTEStateController.calcType == .antenatal {
            
            resultPartOne.image = UIImage(named: "ant_4_1.png")
            resultPartTwo.image = UIImage(named: "ant_4_2.png")
            resultPartOneHeight.constant = 77
            
        } else if VTEStateController.total == 3
            && VTEStateController.calcType == .antenatal {
            
            resultPartOne.image = UIImage(named: "vte_3ant_txt2prt2.png")
            resultPartTwo.image = UIImage(named: "ant_4_2.png")
            resultPartOneHeight.constant = 67
            
        } else if VTEStateController.total < 3
            && VTEStateController.calcType == .antenatal {
            
            resultPartOne.image = UIImage(named: "ant_2_1.png")
            resultPartTwo.image = UIImage(named: "ant_2_2.png")
            resultPartOneHeight.constant = 105
            
        } else if VTEStateController.total >= 2
            && VTEStateController.calcType == .postnatal {
            resultPartOne.image = UIImage(named: "post_3_1.png")
            resultPartTwo.image = UIImage(named: "post_3_2.png")
            resultPartOneHeight.constant = 77
            
        } else if VTEStateController.total < 2
            && VTEStateController.calcType == .postnatal {
            resultPartOne.image = UIImage(named: "ant_2_1.png")
            resultPartTwo.image = UIImage(named: "ant_2_2.png")
            resultPartOneHeight.constant = 105
            
        }
        
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
        
        if let bundleURL = podBundle.url(forResource: "AlertViewController", withExtension: "bundle"){
            
            if let bundle = Bundle(url: bundleURL) {
                return bundle.loadNibNamed("AlertViewController", owner: self, options: nil) as [AnyObject]?
            }
            else {
                assertionFailure("Could not load the bundle")
            }
            
        }
        else if let nib = podBundle.loadNibNamed("AlertViewController", owner: self, options: nil) as [AnyObject]?{
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
