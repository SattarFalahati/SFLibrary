//
//  UIViewExtentions.swift
//  Pods-SFLibrary_Example
//
//  Created by sattar.falahati on 27/03/18.
//

import Foundation

extension UIView
{
    public func roundViewWith(borderColor: UIColor, borderWidth: CGFloat)
    {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth  = borderWidth
        
        self.layer.cornerRadius = self.layer.frame.size.width / 2
        self.clipsToBounds = true
    }
}
