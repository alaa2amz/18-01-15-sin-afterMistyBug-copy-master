//
//  BMIResult.swift
//  Spin
//
//  Created by Mohamed Salah on 1/28/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation

class BMIResult {
    var result : String?
    var value : Float?
    var resultComments : String?
    
    init() {
        
    }
    
    init(result : String, comments : String, value : Float) {
        self.result = result
        self.resultComments = comments
        self.value = value
    }
    
    init(result : String, comments : String) {
        self.result = result
        self.resultComments = comments
    }
}
