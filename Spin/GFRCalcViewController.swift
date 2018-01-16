//
//  GFRCalcViewController.swift
//  Spin
//
//  Created by Mohamed Salah on 1/28/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class GFRCalcViewController: BaseViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var textFieldAge: UITextField!
    @IBOutlet weak var textFieldSerum: UITextField!
    @IBOutlet weak var labelRace: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    
    //MARK:- Variables 
    var stateController : GFRStateController!
    var selectedIndex = 0
    var isMale: Bool = true
    
    //MARK:- UI Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configurePageTitle()
        stateController = GFRStateController()
        
        self.labelRace.text = "Black (African American)"
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
        label.text = "GFR"
        
        self.navigationItem.titleView = label
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }

    
    //MARK:- IBActions
    @IBAction func btnDropListClicked(_ sender: UIButton) {
        let dataArray = [
            "Black (African American)",
            "Other"
        ]
        
        ActionSheetStringPicker.show(withTitle: "Select Option", rows: dataArray, initialSelection: 0, doneBlock: {
            picker, index, value in
            
            self.labelRace.text = value as! String?
            self.selectedIndex = index
            
            return
        }, cancel: nil, origin: sender)
    }
    
    
    @IBAction func btnCalcClicked(_ sender: UIButton) {
        var age : Double = 0.0, serum : Double = 0.0
        
        if let inputAge : Double = Double(textFieldAge.text!) {
            age = inputAge
        }
        
        if let inputSerum : Double = Double(textFieldSerum.text!) {
            serum = inputSerum
        }
        
        if age == 0.0 || serum == 0.0 {
            self.show(error: "Please Enter Valid Values")
        } else {
            let result = stateController.getGFRResults(age: age, serum: serum, other: selectedIndex == 1,sex:self.isMale)
            print("---")
            print(result.result!)
            print(result.resultComments!)
            let vc = GFRAlertViewController(result: result.result!, resultComments: result.resultComments!)
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
