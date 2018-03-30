//
//  SFUtils.swift
//  Pods
//
//  Created by sattar.falahati on 29/03/18.
//

import UIKit

class SFUtils: NSObject
{
    
    // MARK: - Navigation bar
    
    public func setupNavigationbar(backgroundColor: UIColor, withFont font: UIFont, andFontColor fontColor: UIColor)
    {
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().backgroundColor = UIColor.clear
        UINavigationBar.appearance().isTranslucent = false
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font: font, NSAttributedStringKey.foregroundColor:fontColor]
        
        UINavigationBar.appearance().setBackgroundImage(backgroundColor.imageFromColor, for: .default)
    }
    
    public func setupBarBurronItem(imageName: NSString, forTarget target: Any, andSelector selector:Selector) -> UIBarButtonItem
    {
        let image = UIImage(named: imageName as String)
        let btn = UIButton(type: .custom)
        btn.bounds = CGRect(x: 0, y: 0, width: 44, height: 44)
        btn.setImage(image, for: .normal)
        btn.addTarget(target, action: selector, for: .touchUpInside)
        let barBtnItem = UIBarButtonItem(customView: btn)
        return barBtnItem
    }
    
}
