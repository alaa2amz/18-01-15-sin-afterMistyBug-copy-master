//
//  BMIAlertViewController.swift
//  Spin
//
//  Created by Mohamed Salah on 1/28/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class BMIAlertViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak open var alertMaskBackground: UIImageView!
    @IBOutlet weak open var alertView: UIView!
    var animator : UIDynamicAnimator?
    
    @IBOutlet weak var headerImg: UIImageView!
    @IBOutlet weak var resultImg: UIImageView!
    
    @IBOutlet weak var refThreeImg: UIImageView!
    @IBOutlet weak var labelResult: UILabel!
    
    open var gravityDismissAnimation = true
    
    var isFemale: Bool = false
    var isPregnant: Bool = false
    var resultValue: Float!  {
        didSet {
            setData(value: resultValue)
        }
    }
    
    //MARK: - Initialiser
    @objc public convenience init(result : String, resultComments : String) {
        
        self.init()
        let nib = loadNibAlertController()
        if nib != nil{
            self.view = nib![0] as! UIView
        }
        
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        alertView.layer.cornerRadius = 5
        setShadowAlertView()
        
        labelResult.text = result
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
        
        if let bundleURL = podBundle.url(forResource: "BMIAlertViewController", withExtension: "bundle"){
            
            if let bundle = Bundle(url: bundleURL) {
                return bundle.loadNibNamed("BMIAlertViewController", owner: self, options: nil) as [AnyObject]?
            }
            else {
                assertionFailure("Could not load the bundle")
            }
            
        }
        else if let nib = podBundle.loadNibNamed("BMIAlertViewController", owner: self, options: nil) as [AnyObject]?{
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
            var radian = Double.pi
            if style == .default {
                radian = 2 * Double.pi
            }else{
                radian = -2 * Double.pi
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
    
    //SET DATA
    func setData(value: Float) {
        if isFemale {
            if isPregnant {
                if (value>=30){
                    headerImg.image = #imageLiteral(resourceName: "bmi_header_12")
                    resultImg.image = #imageLiteral(resourceName: "bmi_preg_30_txt8prt1")
                    
                }else if (value>=25&&value<30){
                    headerImg.image = #imageLiteral(resourceName: "bmi_header_12")
                    resultImg.image = #imageLiteral(resourceName: "bmi_preg_29")
                    
                }else if (value>=18.5&&value<25){
                    headerImg.image = #imageLiteral(resourceName: "bmi_header_12")
                    resultImg.image = #imageLiteral(resourceName: "bmi_preg_24")
                    
                }else {
                    headerImg.image = #imageLiteral(resourceName: "bmi_header_12")
                    resultImg.image = #imageLiteral(resourceName: "bmi_preg_18")
                }
            }else {
                if (value>=30){
                    headerImg.image = #imageLiteral(resourceName: "bmi_header_1")
                    resultImg.image = #imageLiteral(resourceName: "bmi_non_preg_mor_30")
                    refThreeImg.alpha = 0
                    
                }else if (value>=25&&value<30){
                    headerImg.image = #imageLiteral(resourceName: "bmi_header_1")
                    resultImg.image = #imageLiteral(resourceName: "bmi_non_preg_29")
                    refThreeImg.alpha = 0
                    
                }else if (value>=18.5&&value<25){
                    headerImg.image = #imageLiteral(resourceName: "bmi_header_1")
                    resultImg.image = #imageLiteral(resourceName: "bmi_non_preg_24")
                    refThreeImg.alpha = 0
                    
                }else {
                    headerImg.image = #imageLiteral(resourceName: "bmi_header_1")
                    resultImg.image = #imageLiteral(resourceName: "bmi_non_preg_18")
                    refThreeImg.alpha = 0
                }
            }
        }else {
            if (value>=30){
                headerImg.image = #imageLiteral(resourceName: "bmi_header_1")
                resultImg.image = #imageLiteral(resourceName: "bmi_male_mor_30")
                refThreeImg.alpha = 0
                
            }else if (value>=25&&value<30){
                headerImg.image = #imageLiteral(resourceName: "bmi_header_1")
                resultImg.image = #imageLiteral(resourceName: "bmi_male_29")
                refThreeImg.alpha = 0
                
            }else if (value>=18.5&&value<25){
                headerImg.image = #imageLiteral(resourceName: "bmi_header_1")
                resultImg.image = #imageLiteral(resourceName: "bmi_male_24")
                refThreeImg.alpha = 0
                
            }else {
                headerImg.image = #imageLiteral(resourceName: "bmi_header_1")
                resultImg.image = #imageLiteral(resourceName: "bmi_male_18")
                refThreeImg.alpha = 0
            }
            
        }
    }
}
