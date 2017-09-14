//
//  ViewController.swift
//  VKProfile
//
//  Created by Тимур Шафигуллин on 11.09.17.
//  Copyright © 2017 iOS Lab ITIS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infoScrollView: UIScrollView!
    @IBOutlet weak var photoScrollView: UIScrollView!
    @IBOutlet var menuButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoScrollView.layer.borderWidth = 1
        infoScrollView.layer.borderColor = UIColor.gray.cgColor
        
        photoScrollView.layer.borderWidth = 1
        photoScrollView.layer.borderColor = UIColor.gray.cgColor
        
    }
    
    

}

