//
//  SFUIButtonExtentions.swift
//  Pods
//
//  Created by sattar.falahati on 29/03/18.
//

import Foundation

extension UIButton
{
    public func setAttributedTitleWith(string: NSString, baseFont: UIFont? , baseColor: UIColor?, attributedString: NSString, attributedFont: UIFont?, attributedColor: UIColor?, state: UIControlState)
    {
        var baseF = baseFont
        var baseC = baseColor
        var attributedF = attributedFont
        var attributedC = attributedColor
        
        // Setup some default values
        if baseF == nil { baseF = self.titleLabel?.font }
        if baseC == nil { baseC = self.currentTitleColor }
        if attributedF == nil { attributedF = self.titleLabel?.font }
        if attributedC == nil { attributedC = self.currentTitleColor }
        
        // Setup attributes
        let base : NSDictionary = [NSAttributedStringKey.font: baseF!, NSAttributedStringKey.foregroundColor: baseC!]
        let attributed : NSDictionary = [NSAttributedStringKey.font: attributedF!, NSAttributedStringKey.foregroundColor: attributedC!]
        
        let fainalString = NSMutableAttributedString(string: string as String, attributes: base as? [NSAttributedStringKey : Any])
        
        let myRange = string.range(of: attributedString as String)
        fainalString.addAttributes(attributed as! [NSAttributedStringKey : Any], range: myRange)
        
        self.setAttributedTitle(fainalString, for: state)
    }
}
