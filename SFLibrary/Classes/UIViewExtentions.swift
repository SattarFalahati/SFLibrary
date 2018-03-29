//
//  UIViewExtentions.swift
//  Pods-SFLibrary_Example
//
//  Created by sattar.falahati on 27/03/18.
//

import Foundation

extension UIView
{
    // MARK: - Border and corners
    
    public func roundViewWith(borderColor: UIColor, borderWidth: CGFloat)
    {
        cornerRadiusWith(radius: self.layer.frame.size.width / 2, borderColor: borderColor, borderWidth: borderWidth)
    }
    
    public func cornerRadiusWith(radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat)
    {
        setBorderWith(borderColor: borderColor, borderWidth: borderWidth)
        
        self.layer.cornerRadius = radius
    }
    
    public func setBorderWith(borderColor: UIColor, borderWidth: CGFloat)
    {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth  = borderWidth
        
        self.clipsToBounds = true
    }
    
    // MARK: - Image creation
    
    public func createImageFromView () -> UIImage?
    {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0)
        
        defer {
            UIGraphicsEndImageContext()
        }
        
        if let contex = UIGraphicsGetCurrentContext() {
            self.layer.render(in: contex)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            return image
        }
        
        return nil
    }
    
    // MARK: - Shadow
    
    public func setShadowWith(shadowColor: UIColor,shadowOffset: CGSize,shadowOpacity: CGFloat, shadowRadius: CGFloat)
    {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = Float(shadowOpacity)
        self.layer.shadowRadius = shadowRadius
        self.layer.masksToBounds = false
    }
    
}
