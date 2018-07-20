//
//  SFUIImageExtensions.swift
//  Pods
//
//  Created by sattar.falahati on 20/07/18.
//

import Foundation

extension UIImage
{
    /**
     Set Image with diffrent color
     - parameters:
     - tintColor: image color
     - name: string of image name
     */
    static public func imageWith(name: String, tintColor: UIColor) -> UIImage?
    {
        let image = UIImage(named: name)
        return image?.imageWith(tintColor: tintColor)
    }
    
    public func imageWith(tintColor: UIColor) -> UIImage?
    {
        var image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        tintColor.set()
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return image
    }
}
