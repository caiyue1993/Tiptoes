//
//  SecondaryViewController.swift
//  Tiptoes
//
//  Created by 蔡越 on 17/1/12.
//  Copyright © 2017年 Nanjing University. All rights reserved.
//

import UIKit

class BelowBackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "HOME"
        view.backgroundColor = UIColor.white
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 150, height: 80))
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitle("button", for: .normal)
        button.addTarget(self, action: #selector(nav), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    func nav(){
        let vc = TopMostViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
