//
//  OvarianCalculatorTableViewController.swift
//  Spin
//
//  Created by Alaa on 12/9/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class OvarianCalculatorTableViewController: UITableViewController {
    
   
    
    
    
   
    
    //MARK: iB Outlets
    @IBOutlet weak var resultDigitLabel: UILabel!
    @IBOutlet weak var serumValueField: UITextField!
    @IBOutlet weak var resultBadgeLabel: UILabel!
    @IBOutlet weak var multilocularButton: UIButton!
    @IBOutlet weak var solidAreasButton: UIButton!
    @IBOutlet weak var metastasisButton: UIButton!
    @IBOutlet weak var ascitesButton: UIButton!
    @IBOutlet weak var bilateralButton: UIButton!
    @IBOutlet weak var postMenopausalButton: UIButton!
    @IBOutlet weak var preMenopausalButton: UIButton!
    //MARK: iVars
     var limit = 50
    var ovarianCancerCalculator : ovarianCancerGuideLogic!
    var ultrasonic : UltraSoundScan!
    var ultraScanScore = 0
    var menopausal : Menopausal = .premenopausal
    //MARK: alert implemention
  //  let alertController = UIAlertController(title: "Warning", message: "Please Enter Valid\nSERUM Cancer Antigen Value", preferredStyle: .alert)
  //  let alertAction = UIAlertAction(title: "Please Enter Valid\nSERUM Cancer Antigen Value", style: .default, handler: nil)
    
    
    
//    //MARK: iB Actions
//    @IBAction func calculateRMI(_ sender: Any) {
//        ovarianCancerCalculator.serumCancer = (NumberFormatter().number(from: serumValueField.text!)?.doubleValue)!
//        ovarianCancerCalculator.menopausalStatus = menopausal.rawValue
//        ovarianCancerCalculator.ultraSoundScore = ultrasonic.ultraSoundScoreValue
//       print( String(ovarianCancerCalculator.getRmi()))
//
//    }
//    
    
    @IBAction func ButtonClicked(_ sender: Any) {
         print (preMenopausalButton.state)
        let clickedButton = sender as! UIButton
        var currentState  =  clickedButton.isSelected
        clickedButton.isSelected = !currentState
        switch clickedButton {
        case multilocularButton:
            ultrasonic.multilocular = !currentState
        case solidAreasButton:
            ultrasonic.solidAreas = !currentState
        case metastasisButton:
            ultrasonic.metastasis = !currentState
        case ascitesButton:
            ultrasonic.ascites = !currentState
        case bilateralButton:
            ultrasonic.bilateral = !currentState
        case postMenopausalButton:
           postMenopausalButton.isSelected = true
            menopausal = .postmenopausal
            preMenopausalButton.isSelected = false
        case preMenopausalButton:
           preMenopausalButton.isSelected = true
            menopausal = .premenopausal
           postMenopausalButton.isSelected = false
            //ultrasonic.multilocular = !currentState
        default:
            print("error")
             }
       
       
       
        
        
    }
    
    @IBAction func calc(_ sender: Any) {
       // present(alertController, animated: true, completion: nil)
        ovarianCancerCalculator.serumCancer = (NumberFormatter().number(from: serumValueField.text!)?.doubleValue)!
        ovarianCancerCalculator.menopausalStatus = menopausal.rawValue
        ovarianCancerCalculator.ultraSoundScore = ultrasonic.ultraSoundScoreValue
        print( String(ovarianCancerCalculator.getRmi()))
        let rmi = ovarianCancerCalculator.getRmi()
        let vc = RMIAlertViewController(result: String(rmi), resultComments: rmi<limit ? "RMI I indicates low risk of malignancy.":"RMI I indicates increased risk of malignancy")
        self.present(vc, animated: true, completion: nil)
    }
    
    
   
    func btnRefreshTapped(_ sender: UIBarButtonItem) {
        multilocularButton.isSelected = false
        solidAreasButton.isSelected = false
        metastasisButton.isSelected = false
        ascitesButton.isSelected = false
        bilateralButton.isSelected = false
        serumValueField.text = "0"
        
        
        
    }
    
    //MARK: loading methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
         self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_refresh"), style: .plain, target: self, action: #selector(btnRefreshTapped(_:)))
        
        
        //alertController.addAction(alertAction)
        ultrasonic = UltraSoundScan()
        preMenopausalButton.isSelected = true
        ovarianCancerCalculator = ovarianCancerGuideLogic(ultraSoundScore: ultraScanScore, menopausalStatus: menopausal, serumCancer: (NumberFormatter().number(from: serumValueField.text!)?.doubleValue)!)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       print("hjjkujtjt")
        serumValueField.resignFirstResponder()
        let cview :Bool = touches.first?.view is  UITextInputTraits
        
        if !cview { self.view.endEditing(true)
            serumValueField.resignFirstResponder()
        }
    }


}
