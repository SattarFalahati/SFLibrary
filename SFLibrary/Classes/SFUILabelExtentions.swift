//
//  SFUILabelExtentions.swift
//  Pods
//
//  Created by sattar.falahati on 30/03/18.
//

import Foundation

extension UILabel
{
    public func setAttributedTextWith(string: NSString, baseFont: UIFont? , baseColor: UIColor?, attributedString: NSString, attributedFont: UIFont?, attributedColor: UIColor?, state: UIControl.State)
    {
        var baseF = baseFont
        var baseC = baseColor
        var attributedF = attributedFont
        var attributedC = attributedColor
        
        // Setup some default values
        if baseF == nil { baseF = self.font }
        if baseC == nil { baseC = self.textColor }
        if attributedF == nil { attributedF = self.font }
        if attributedC == nil { attributedC = self.textColor }
        
        // Setup attributes
        let base : NSDictionary = [NSAttributedString.Key.font: baseF!, NSAttributedString.Key.foregroundColor: baseC!]
        let attributed : NSDictionary = [NSAttributedString.Key.font: attributedF!, NSAttributedString.Key.foregroundColor: attributedC!]
        
        let fainalString = NSMutableAttributedString(string: string as String, attributes: base as? [NSAttributedString.Key : Any])
        
        let myRange = string.range(of: attributedString as String)
        fainalString.addAttributes(attributed as! [NSAttributedString.Key : Any], range: myRange)
        
        self.attributedText = fainalString
    }
    
    
    public func changeFontWithAnimation(font: UIFont, duration: TimeInterval)
    {
        let labelScale = self.font.pointSize / font.pointSize
        self.font = font
        let oldTransform = transform
        transform = transform.scaledBy(x: labelScale, y: labelScale)
        setNeedsUpdateConstraints()
        UIView.animate(withDuration: duration) {
            self.transform = oldTransform
            self.layoutIfNeeded()
        }
    }
}
