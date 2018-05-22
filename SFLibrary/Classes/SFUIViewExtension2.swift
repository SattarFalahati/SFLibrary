//
//  SFUIViewExtension.swift
//  Immobiliare.it
//
//  Created by sattar.falahati on 20/04/18.
//  Copyright © 2018 Gruppo Immobiliare.it. All rights reserved.
//

import UIKit

extension UIView
{
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat
    {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor
        {
        get {
            return .clear
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}
