//
//  ViewController.swift
//  TestSingleViewAppProject
//
//  Created by Ildar Zalyalov on 11.09.17.
//  Copyright © 2017 ru.itisIosLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var actionButton: UIButton!
    
    var someClass: ViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let anyVar: Any = "asd"
        
        let newv = "someString" + (anyVar as! String)
        
    }
    
    func generateData(with word: inout String) {
        
        var mutableString = word
        mutableString = "sdasd"
    }
    
    @IBAction func actionButtonPressed(_ sender: UIButton) {
        
        let buttonText = sender.isHighlighted ? "Выбрано" : "Не выбрано"
        
        sender.setTitle(buttonText, for: .normal)
    }
}

struct SomeStructure {
    
}

fileprivate extension String {
    
    func sayMyName() -> String {
        
        return ""
    }
}
