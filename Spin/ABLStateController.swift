//
//  ABLStateController.swift
//  Spin
//
//  Created by Mohamed Salah on 1/30/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation

class ABLStateController {
    //MARK:- Formulas 
    /*
        EBV (mL) = Body weight (kg) x 65 (ml/kg)**
        ABL (mL) = [EBV x (Hi-Hf)]/Hi
    */
    
    private func getEBV(weight : Float) -> Int {
        return Int(weight * 65.0)
    }
    
    private func getABL (ebv : Float, hInitial : Float, hFinal : Float) -> Int {
        return Int((ebv * (hInitial - hFinal)) / hInitial)
    }
    
    //MARK:- get Result
    func getABLResults (weight : Float, hInitial : Float, hFinal : Float) -> ABLResult {
        let ebv = getEBV(weight: weight)
        let abl = getABL(ebv: Float(ebv), hInitial: hInitial, hFinal: hFinal)
        
        return ABLResult(ebv: "\(ebv)", abl: "\(abl)")
    }
    
}
