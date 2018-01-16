//
//  BaseViewController.swift
//  Ajlan Awards
//
//  Created by Mivors on 12/14/16.
//  Copyright © 2016 Mivors. All rights reserved.
//

import UIKit
import SwiftMessages
import DZNWebViewController


class BaseViewController: UIViewController {
    
    var navVc : UINavigationController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        
        self.view.addGestureRecognizer(tap)
    }

   
    
    
     func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func startProgressAnimation() {
        ALLoadingView.manager.showLoadingView(ofType: .basic, windowMode: .fullscreen)
    }
    
    func stopProgressAnimation() {
        ALLoadingView.manager.hideLoadingView(withDelay: 0.0)
    }
    
    
    func show(error : String) {
        
        // View setup
        
        let view: MessageView!
        view = MessageView.viewFromNib(layout: .tabView)
        
        let msg = error.isEmpty ? "Error" : error
        
        view.configureContent(title: "", body: msg, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "", buttonTapHandler: { _ in SwiftMessages.hide() })
        
        let iconStyle: IconStyle = .default
        
        view.configureTheme(.error, iconStyle: iconStyle)
        view.configureDropShadow()
        
        view.button?.isHidden = true
        
        // Config setup
        var config = SwiftMessages.defaultConfig
        config.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        config.duration = .seconds(seconds: 1)
        config.preferredStatusBarStyle = .lightContent
        
        // Show
        SwiftMessages.show(config: config, view: view)
    }
    
    func showWebView (url : String) {
        let vc = DZNWebViewController(fileURL: URL(string: url))
        navVc = BaseNavigationController(rootViewController: vc!)
        
        let button1 = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.btnDoneWebView(_:)))
        vc?.navigationItem.rightBarButtonItem  = button1
        
        
        navVc.navigationBar.barTintColor = UIColor(red: 57/255, green: 82/255, blue: 154/255, alpha: 1)
        navVc.navigationBar.tintColor = UIColor.white
        navVc.navigationBar.isTranslucent = false
        
        vc?.supportedWebNavigationTools = .all
        vc?.supportedWebActions = .DZNWebActionAll
        vc?.showLoadingProgress = true
        vc?.allowHistory = false
        vc?.hideBarsWithGestures = false
        
        self.present(navVc, animated: true, completion: nil)
    }
    
    
    @IBAction func btnDoneWebView (_ sender: UIButton) {
        navVc.dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
