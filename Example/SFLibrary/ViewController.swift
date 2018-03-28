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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        imgTest.roundViewWith(borderColor: .white, borderWidth: 2)
        
    }
}

