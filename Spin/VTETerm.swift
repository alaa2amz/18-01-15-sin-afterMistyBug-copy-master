//
//  VTETerm.swift
//  Spin
//
//  Created by Mohamed Salah on 1/28/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation

class VTETerm {
    var term : String = ""
    var termImage: String = ""
    var score : Int = 0
    var selected : Bool = false
    var color : UIColor = UIColor.black
    
    init(term: String, score: Int) {
        self.term = term
        self.score = score
    }
    
    init(term: String, score: Int, color: UIColor, _ termImage: String) {
        self.term = term
        self.score = score
        self.color = color
        self.termImage = termImage
    }
}
