//
//  ViewController.swift
//  SFLibrary
//
//  Created by sattar.falahati@gmail.com on 03/27/2018.
//  Copyright (c) 2018 sattar.falahati@gmail.com. All rights reserved.
//

import UIKit

import SFLibrary

class ViewController: UIViewController
{
    // MARK: -
    
    @IBOutlet weak var imgTest: UIImageView!
    @IBOutlet weak var imgNewTest: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI()
    {
        // Reound View Test
         imgTest.roundViewWith(borderColor: .white, borderWidth: 2)
        
        // Corner Radius
        // imgTest.cornerRadiusWith(radius: 10, borderColor: .white, borderWidth: 2)
        
        // Borser
        // imgTest.setBorderWith(borderColor: .brown, borderWidth: 2)
        
        // Create image from view
        imgNewTest.image = imgTest.createImageFromView()
        imgNewTest.roundViewWith(borderColor: .clear, borderWidth: 0)
        
        // Shadow
        // imgTest.setShadowWith(shadowColor: .white, shadowOffset: CGSize(width: 0, height: 0), shadowOpacity: 1, shadowRadius: 10)
     
        view.backgroundColor = UIColor().colorWithHex(string: "8670ee", colorAlpha: 1)
    }
}

