//
//  SecondaryViewController.swift
//  Tiptoes
//
//  Created by 蔡越 on 17/1/12.
//  Copyright © 2017年 Nanjing University. All rights reserved.
//

import UIKit

class BelowBackViewController: UIViewController {

    lazy var demoButton: UIButton = {
        let b = UIButton()
        b.setTitle("JUMP TO NEXT", for: .normal)
        b.setTitleColor(UIColor.black, for: .normal)
        b.addTarget(self, action: #selector(nav), for: .touchUpInside)
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "HOME"
        view.backgroundColor = .white
        view.addSubview(demoButton)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        demoButton.center = view.center
        demoButton.sizeToFit()
    }
    
    func nav(){
        let vc = TopMostViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
