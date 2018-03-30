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
    
    @IBOutlet weak var lblTest: UILabel!
    @IBOutlet weak var btnTest: UIButton!
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
        // imgNewTest.image = imgTest.createImageFromView()
         imgNewTest.image = UIColor().colorWithHex(string: "d5e5ed", colorAlpha: 1).imageFromColor
        imgNewTest.roundViewWith(borderColor: .clear, borderWidth: 0)
        
        // Shadow
        // imgTest.setShadowWith(shadowColor: .white, shadowOffset: CGSize(width: 0, height: 0), shadowOpacity: 1, shadowRadius: 10)
     
        // Color with hex
        view.backgroundColor = UIColor().colorWithHex(string: "8670ee", colorAlpha: 1)
        
        // Button
        btnTest.setAttributedTitleWith(string: "this is a button", baseFont: UIFont.systemFont(ofSize: 22), baseColor: .white, attributedString: "button", attributedFont: UIFont.boldSystemFont(ofSize: 40), attributedColor: .cyan, state: .normal)
        
        // Label
        lblTest.setAttributedTextWith(string: "this is a label", baseFont: UIFont.systemFont(ofSize: 22), baseColor: .cyan, attributedString: "label", attributedFont: UIFont.boldSystemFont(ofSize: 40), attributedColor: .white, state: .normal)
        
    }
}

