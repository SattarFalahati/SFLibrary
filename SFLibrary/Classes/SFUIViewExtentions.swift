//
//  SFUIViewExtentions.swift
//  Pods-SFLibrary_Example
//
//  Created by sattar.falahati on 27/03/18.
//

import Foundation

extension UIView
{
    // MARK: - Border and corners
    
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
    
    public func setBottomCornerRadiusWith(radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat)
    {
        if #available(iOS 11.0, *) {
            self.clipsToBounds = true
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            
            if borderWidth != 0 {
                self.setBorderWith(borderColor: borderColor, borderWidth: borderWidth)
            }
        }
        else{
            self.roundCornersWith(corners: [.bottomLeft , .bottomRight], radius: radius, borderColor: borderColor, borderWidth: borderWidth)
        }
    }
    
    public func setTopCornerRadiusWith(radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat)
    {
        if #available(iOS 11.0, *) {
            self.clipsToBounds = true
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
           
            if borderWidth != 0 {
                self.setBorderWith(borderColor: borderColor, borderWidth: borderWidth)
            }
        }
        else{
            self.roundCornersWith(corners: [.topRight , .topLeft], radius: radius, borderColor: borderColor, borderWidth: borderWidth)
        }
    }
    
    public func roundCornersWith(corners: UIRectCorner, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat)
    {
        // Setup bezier path
        let bezPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        
        // Setup round corners
        let rectShape = CAShapeLayer()
        rectShape.frame = self.bounds
        rectShape.path = bezPath
        self.layer.mask = rectShape
        
        // Setup border
        let rectShapeForBorder = CAShapeLayer()
        rectShapeForBorder.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        rectShapeForBorder.strokeColor = borderColor.cgColor
        rectShapeForBorder.fillColor = UIColor.clear.cgColor
        rectShapeForBorder.lineWidth = borderWidth
        rectShapeForBorder.frame = .zero
        self.layer.addSublayer(rectShapeForBorder)
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
