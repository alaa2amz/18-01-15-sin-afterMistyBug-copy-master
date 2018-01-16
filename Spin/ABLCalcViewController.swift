//
//  ABLCalcViewController.swift
//  Spin
//
//  Created by Mohamed Salah on 1/30/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class ABLCalcViewController: BaseViewController {
    
    
    func btnRefreshTapped(_ sender: UIBarButtonItem) {
        textFieldFinalH.text = ""
        textFieldInitalH.text = ""
        textFieldBodyWeight.text = ""
    }
    //MARK:- IBOutlets
    @IBOutlet weak var textFieldBodyWeight: UITextField!
    @IBOutlet weak var textFieldInitalH: UITextField!
    @IBOutlet weak var textFieldFinalH: UITextField!
    @IBOutlet weak var labelGender: UILabel!
    
    //MARK:- Variables
    var stateController : ABLStateController!
    var isMale: Bool = true
    
    //MARK:- UI Methods
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_refresh"), style: .plain, target: self, action: #selector(btnRefreshTapped(_:)))
        // Do any additional setup after loading the view.
        configurePageTitle()
        stateController = ABLStateController()
        self.labelGender.text = "Male"
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
        label.text = "ABL"
        
        self.navigationItem.titleView = label
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    
    //MARK:- IBActions
    
    @IBAction func btnCalcClicked(_ sender: UIButton) {
        var weight : Float = 0.0, hInital : Float = 0.0, hFinale : Float = 0.0
        
        if let inputweight : Float = Float(textFieldBodyWeight.text!) {
            weight = inputweight
        }
        
        if let inputHinital : Float = Float(textFieldInitalH.text!) {
            hInital = inputHinital
        }
        
        if let inputHFinal : Float = Float(textFieldFinalH.text!) {
            hFinale = inputHFinal
        }
        
        if weight == 0.0 || hInital == 0.0 || hFinale == 0.0 {
            self.show(error: "Please Enter Valid Values")
        } else {
            let result = stateController.getABLResults(weight: weight, hInitial: hInital, hFinal: hFinale)
            
            let vc = ABLAlertViewController(EBV: result.ebv, ABL: result.abl)
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func btnDropDownGender(_ sender: Any) {
        let dataArray = [
            "Male",
            "Female"
        ]
        
        ActionSheetStringPicker.show(withTitle: "Select Option", rows: dataArray, initialSelection: 0, doneBlock: {
            picker, index, value in
            
            self.labelGender.text = value as! String?
            
            if index == 0 {
                self.isMale = true
            } else {
                self.isMale = false
            }
            
            return
        }, cancel: nil, origin: sender)
        
    }

}
