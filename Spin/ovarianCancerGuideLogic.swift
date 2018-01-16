//
//  ovarianCancerGuideLogic.swift
//  Spin
//
//  Created by Alaa on 12/9/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//
/*
 int ultraSound, menopausal;
 double weight, height, himoInitial, himoFinal, age, creatinine, serumCancer;
 boolean pregnant;
 
 public static int PREMENOPAUSAL = 1;
 public static int POSTMENOPAUSAL = 3;
 public double calcRMI() {
 return (ultraSound >= 2) ? serumCancer * 3 * menopausal : serumCancer * ultraSound * menopausal;
 }
 */
import UIKit

enum Menopausal : Int {
    case premenopausal = 1
    case postmenopausal = 3
}

struct UltraSoundScan {
    var multilocular : Bool = false
    var solidAreas : Bool = false
    var bilateral : Bool = false
    var metastasis : Bool = false
    var ascites : Bool  = false
    var multilocularScore : Int { return multilocular ? 1 : 0}
     var solidAreasScore : Int { return solidAreas ? 1 : 0}
    var bilateralScore : Int { return bilateral ? 1 : 0}
    var metastasisScore : Int { return metastasis ? 1 : 0}
    var ascitesScore : Int { return ascites ? 1 : 0}
    
    var ultraSoundScoreValue : Int { return multilocularScore + solidAreasScore + bilateralScore + metastasisScore + ascitesScore }
}
class ovarianCancerGuideLogic: NSObject {
    
   
    
    var ultraSoundScore = 0
    var menopausalStatus = Menopausal.premenopausal.rawValue
    var serumCancer = 0.0
    init(ultraSoundScore : Int ,menopausalStatus : Menopausal,serumCancer:Double) {
        self.ultraSoundScore = ultraSoundScore
        self.serumCancer = serumCancer
        self.menopausalStatus = menopausalStatus.rawValue
    
    }
    func getRmi() -> Int {
        return Int(((ultraSoundScore >= 2) ? serumCancer * 3.0 * Double(menopausalStatus) : serumCancer * Double(ultraSoundScore) * Double(menopausalStatus)))
    }

}
