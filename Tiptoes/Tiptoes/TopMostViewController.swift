//
//  ViewController.swift
//  Tiptoes
//
//  Created by 蔡越 on 17/1/12.
//  Copyright © 2017年 Nanjing University. All rights reserved.
//

import UIKit

class TopMostViewController: UIViewController {
    
    lazy var hintLabel: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = "SWIPE TO RETURN"
        l.sizeToFit()
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NEXT"
        view.addSubview(hintLabel)
        view.backgroundColor = .white
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        hintLabel.center = view.center
    }
}

