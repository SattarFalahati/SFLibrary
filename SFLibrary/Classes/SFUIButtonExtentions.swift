//
//  SFUIButtonExtentions.swift
//  Pods
//
//  Created by sattar.falahati on 29/03/18.
//

import Foundation

extension UIButton
{
    /**
     Set attributed title for button, Use this method to have a button with two diffrent font and font color
     - parameters:
        - string: Complete string
        - baseFont: Font
        - baseColor: Color
        - attributedString: String that you want to have a diffrent color and font
        - attributedFont: Font
        - attributedColor: Color
        - state: state of button
     */
    public func setAttributedTitleWith(string: NSString, baseFont: UIFont? , baseColor: UIColor?, attributedString: NSString, attributedFont: UIFont?, attributedColor: UIColor?, state: UIControl.State)
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
        let base : NSDictionary = [NSAttributedString.Key.font: baseF!, NSAttributedString.Key.foregroundColor: baseC!]
        let attributed : NSDictionary = [NSAttributedString.Key.font: attributedF!, NSAttributedString.Key.foregroundColor: attributedC!]
        
        let fainalString = NSMutableAttributedString(string: string as String, attributes: base as? [NSAttributedString.Key : Any])
        
        let myRange = string.range(of: attributedString as String)
        fainalString.addAttributes(attributed as! [NSAttributedString.Key : Any], range: myRange)
        
        self.setAttributedTitle(fainalString, for: state)
    }
    
    /**
     Set Image with diffrent color
     - parameters:
        - color: image color
        - imgName: string of image name
        - state: Control state of ui button *** If not set == .normal ***
     */
    public func setImage(name: String, color: UIColor, state: UIControl.State)
    {
        let image = UIImage.imageWith(name: name, tintColor: color)
        self.setImage(image, for: state)
    }
    
    public func setImage(imgName: String, color: UIColor)
    {
        setImage(name: imgName, color: color, state: .normal)
    }
}
