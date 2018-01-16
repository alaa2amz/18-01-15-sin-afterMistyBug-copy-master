//
//  BMIStateController.swift
//  Spin
//
//  Created by Mohamed Salah on 1/28/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation

class BMIStateController {
    
    //MARK:- BMI Formula
    func getBMI (weight : Float, height : Float) -> Float {
        let bmi = weight / (height * height)
        return Float(round(10*bmi)/10)
    }
    
    //MARK:- BMI Results 
    func getBMIResults (weight : Float, height : Float, isPregnant : Bool) -> BMIResult {
        let result = getBMI(weight: weight, height: height)
        
        if result < 18.5 {
            let comments = isPregnant ? "Your patient is underweight\nThe recommended weight gain is 12.5 to 18 kg" : "Your patient is underweight"
            
            return BMIResult(result: "<18 Kg/m2", comments: comments, value: result)
            
        } else if result >= 18.5 && result <= 24.9 {
            let comments = isPregnant ? "Your patient is normal or Healthy Weight\nThe recommended weight gain is 11.5 to 16 kg" : "Your patient is normal or Healthy Weight"
            
            return BMIResult(result: "18.5-24.9 Kg/m2", comments: comments, value: result)
            
        } else if result >= 25.0 && result <= 29.9 {
            let comments = isPregnant ? "Your patient is overweight\nThe recommended weight gain is 7 to 11.5 kg" : "Your patient is overweight"
            
            return BMIResult(result: "25.0-29.9 Kg/m2", comments: comments, value: result)
        } else {
            let comments = isPregnant ? "Your patient is obese\nThe recommended weight gain is 16 to 20.5 kg" : "Your patient is obese"
            
            return BMIResult(result: ">=30 Kg/m2", comments: comments, value: result)
        }
        
    }
}
