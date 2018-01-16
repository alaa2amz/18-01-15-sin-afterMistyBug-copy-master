//
//  UIView+Extension.swift
//  DesignTest
//
//  Created by Mivors on 12/22/16.
//  Copyright © 2016 Mivors. All rights reserved.
//

import UIKit

@IBDesignable
class customLabel: UILabel {}

@IBDesignable
class customButton: UIButton {}

@IBDesignable
class CustomImageView: UIImageView {}


@IBDesignable
class customTextField : UITextField {
    
    @IBInspectable
    var placeholderTextColor : UIColor = UIColor.gray {
        didSet {
            guard let placeholder = placeholder else {
                return
            }
            
            self.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                            attributes: [NSForegroundColorAttributeName: placeholderTextColor])
        }
        
    }
}


extension UIView {
    @IBInspectable
    var borderWidth : CGFloat {
        set {
            self.layer.borderWidth = newValue
        }
        
        get {
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable
    var borderColor : UIColor {
        set {
            self.layer.borderColor = newValue.cgColor
        }
        
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
    
    
    @IBInspectable
    var cornerRaduis : CGFloat {
        set {
            self.layer.cornerRadius = newValue
        }
        
        get {
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable
    var shadowRadius : CGFloat {
        set {
            self.layer.shadowRadius = newValue
        }
        
        get {
            return self.layer.shadowRadius
        }
    }
    
    
    @IBInspectable
    var shadowOffset : CGSize {
        set {
            self.layer.shadowOffset = newValue
        }
        
        get{
            return self.layer.shadowOffset
        }
    }
    
    
    @IBInspectable
    var makeCircular : Bool? {
        get {
            return nil
        }
        
        set {
            if newValue != nil {
                cornerRaduis = min(bounds.width, bounds.height) / 2.0
            }
        }
    }
    
    
    
    
}

@IBDesignable
class customView : UIView {
    
}
