//
//  BMICalcViewController.swift
//  Spin
//
//  Created by Mohamed Salah on 1/28/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit
import SwiftMessages
import ActionSheetPicker_3_0

class BMICalcViewController: BaseViewController {
    //MARK:- IBOutlets
    
    @IBOutlet weak var textFieldHeight: UITextField!
    @IBOutlet weak var textFieldWeight: UITextField!
    @IBOutlet weak var btnCheckbox: UIButton!
    @IBOutlet weak var btnCheckboxNon: UIButton!
    @IBOutlet weak var viewPregnant: UIView!
    
    @IBOutlet weak var labelGender: UILabel!
    
    //MARK:- variables
    var isPregnant : Bool = false {
        didSet {
            switch isPregnant {
            case true:
                isNonPregnant = false
                btnCheckbox.setBackgroundImage(UIImage(named: "ic_check_selected"), for: .normal)
                break
            case false:
                btnCheckbox.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
            }
        }
    }
    
    var isNonPregnant : Bool = false {
        didSet {
            switch isNonPregnant {
            case true:
                isPregnant = false
                btnCheckboxNon.setBackgroundImage(UIImage(named: "ic_check_selected"), for: .normal)
                break
            case false:
                btnCheckboxNon.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
            }
        }
    }
    
    var isMale: Bool = true
    var stateController : BMIStateController!
    
    //MARK:- UI Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configurePageTitle()
        
        stateController = BMIStateController()
        
        viewPregnant.alpha = 0
        self.labelGender.text = "Male"
    }
    
    //MARK:- Configuratiuon
    func configurePageTitle(){
        let frame : CGRect = CGRect(x: 0, y: 0, width: 100, height: 30)
        let label : UILabel = UILabel(frame: frame)
        
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Nexa Light", size: 22.0)
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        label.text = "BMI Calculator"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_refresh"), style: .plain, target: self, action: #selector(btnRefreshTapped(_:)))
        
        
        self.navigationItem.titleView = label
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    //MARK:- IBActions
    func btnRefreshTapped(_ sender: UIBarButtonItem) {
        textFieldHeight.text = ""
        textFieldWeight.text = ""
        
        labelGender.text = "Male"
        viewPregnant.alpha = 0
        
        isMale = true
        isPregnant = false
        isNonPregnant = false
    }
    
    @IBAction func btnCalcClicked(_ sender: UIButton) {
        var height : Float = 0.0, weight : Float = 0.0
        
        if let wrapHeight = Float(textFieldHeight.text!) {
            height = wrapHeight
        }
        
        if let wrapWeight = Float(textFieldWeight.text!) {
            weight = wrapWeight
        }
        
        if weight == 0.0 || height == 0.0 {
            self.show(error: "Please Enter Valid Values")
        } else {
            let result = stateController.getBMIResults(weight: Float(weight), height: Float(height), isPregnant: isPregnant)
            let bmi = weight/pow(height/100,2.0)
            let vc = BMIAlertViewController(result: String(format:"%.2f",bmi) + " kg/m²", resultComments: result.resultComments!)
            vc.isFemale = !isMale
            vc.isPregnant = self.isPregnant
            vc.resultValue = bmi
            
            
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func btnCheckboxClicked(_ sender: UIButton) {
        if sender == btnCheckbox {
            isPregnant = !isPregnant
        } else {
            isNonPregnant = !isNonPregnant
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
                self.viewPregnant.alpha = 0
            } else {
                self.isMale = false
                self.viewPregnant.alpha = 1
            }
            
            return
        }, cancel: nil, origin: sender)
        
    }
    
    
}
