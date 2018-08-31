//
//  SFGradientView.swift
//  Pods
//
//  Created by sattar.falahati on 14/08/2018.
//

import UIKit

@IBDesignable
public class SFGradientView: UIView
{
    
    @IBInspectable public var firstColor: UIColor = UIColor.white {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable public var secondColor: UIColor = UIColor.white {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable public var horizontalGradient: Bool = false {
        didSet {
            setupView()
        }
    }
    
    override public class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func setupView()
    {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [ firstColor.cgColor, secondColor.cgColor ]
        
        if (horizontalGradient) {
            layer.startPoint = CGPoint(x: 0.0, y: 0.5)
            layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        else {
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint(x: 0, y: 1)
        }
    }
}
