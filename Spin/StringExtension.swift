//
//  StringExtension.swift
//  Ajlan Awards
//
//  Created by Mivors on 12/18/16.
//  Copyright © 2016 Mivors. All rights reserved.
//

import Foundation
import Alamofire

extension String {
    
    func isEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
}

