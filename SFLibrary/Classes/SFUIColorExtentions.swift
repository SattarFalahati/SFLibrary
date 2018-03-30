//
//  SFUIColorExtentions.swift
//  Pods
//
//  Created by sattar.falahati on 29/03/18.
//

import Foundation

extension UIColor
{
    public func colorWithHex(string: String, colorAlpha: CGFloat?) -> UIColor
    {
        var strColor:String = string.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (strColor.hasPrefix("#")) {
            strColor.remove(at: strColor.startIndex)
        }
        
        if ((strColor.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: strColor).scanHexInt32(&rgbValue)
        
        var colorAlpha = colorAlpha
        
        if colorAlpha == nil
        {
            colorAlpha = CGFloat(1.0)
        }
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: colorAlpha!
        )
    }
    
    public var imageFromColor: UIImage
    {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
