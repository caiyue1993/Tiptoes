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
        view.backgroundColor = UIColor(red: 59.0/255.0, green: 62.0/255.0, blue: 67.0/255.0, alpha: 1.0)
        let button = UIButton(frame: CGRect(x: view.frame.width / 2, y: 100, width: 150, height: 80))
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(nav), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    func nav(){
        let vc = TopMostViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
