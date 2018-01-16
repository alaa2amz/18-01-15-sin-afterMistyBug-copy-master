//
//  VTEdosageTableViewController.swift
//  Spin
//
//  Created by A on 12/11/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class VTEdosageTableViewController: UITableViewController,UITextFieldDelegate {
    //MARK: variables
    
    @IBOutlet weak var weightTextFeild: UITextField!
    //MARKS: functions
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.isHidden = true
        textField.resignFirstResponder()
        textField.returnKeyType = .done
        return true
    }
    /*
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool  {
        
        let currentCharacterCount = textField.text?.count ?? 0
        if (range.length + range.location > currentCharacterCount){
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        return newLength <= 3
    }
 */
    @IBAction func calculateVteDosage(_ sender: Any) {
        var weight = 0.0
        var dosage = 0.0
        if let enteredWeight = NumberFormatter().number(from: weightTextFeild.text!)?.doubleValue
            
        {
       weight = enteredWeight
            
        }
        
        switch weight {
        case 0...50:
            dosage = 20
        case 51...90:
            dosage = 40
        case 91...170:
            dosage = 60
        case 171...:
            dosage = 0.6
        default:
            print("some error entered")
        }
        let vc = VTEDOSEAlertViewController(result: dosage == 0.6 ? "\(String(format:"%.1f",dosage)) mg/kg/day":"\(String(format:"%.1f",dosage)) mg\ndaily", resultComments: "tyuio")
        self.present(vc, animated: true, completion: nil)
        
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_refresh"), style: .plain, target: self, action: #selector(btnRefreshTapped(_:)))

       
    }

  
    @IBOutlet weak var textField: UITextField!
    func btnRefreshTapped(_ sender: UIBarButtonItem) {
       textField.text = ""
    }

 

}
