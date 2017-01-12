//
//  TiptoesNavController.swift
//  Tiptoes
//
//  Created by 蔡越 on 17/1/12.
//  Copyright © 2017年 Nanjing University. All rights reserved.
//

import UIKit

class TiptoesNavController: UINavigationController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override init(rootViewController: UIViewController) {
        super.init(navigationBarClass: TiptoesNavBar.self, toolbarClass: nil)
        viewControllers = [rootViewController]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isHidden = true
        if let bar = navigationBar as? TiptoesNavBar {
            view.addSubview(bar.realBar)
            view.addSubview(bar.barTitle)
            bar.realBar.frame = CGRect(x: 0, y: view.frame.height - 20, width: view.frame.width, height: 20)
            bar.barTitle.frame = CGRect(x: 0, y: 300, width: 100, height: 40)
        }
    }
    
}

extension TiptoesNavController: UINavigationBarDelegate {
    public func navigationBar(_ navigationBar: UINavigationBar, shouldPush item: UINavigationItem) -> Bool {
        print(item.title)
        return true
    }
    
    public func navigationBar(_ navigationBar: UINavigationBar, didPush item: UINavigationItem) {
         print(item.title)
    }
    
    public func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        print(item.title)
        return true
    }
    
    public func navigationBar(_ navigationBar: UINavigationBar, didPop item: UINavigationItem) {
        print(item.title)
    }
}

class TiptoesNavBar: UINavigationBar {
    
    var barTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8)
        return label
    }()
    
    var realBar: UIView = {
        let bar = UIView()
        bar.backgroundColor = UIColor.lightGray
        return bar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
