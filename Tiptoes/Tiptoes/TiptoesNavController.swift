//
//  TiptoesNavController.swift
//  Tiptoes
//
//  Created by 蔡越 on 17/1/12.
//  Copyright © 2017年 Nanjing University. All rights reserved.
//

import UIKit

class TiptoesNavController: UINavigationController {
    
    var barCurrentTitleLabel: UILabel {
        get {
            if let bar = navigationBar as? TiptoesNavBar {
                return bar.currentTitleLabel
            } else {
                return UILabel()
            }
        }
    }
    
    var barPriorTitleLabel: UILabel {
        get {
            if let bar = navigationBar as? TiptoesNavBar {
                return bar.priorTitleLabel
            } else {
                return UILabel()
            }
        }
    }
    
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
            view.addSubview(bar.currentTitleLabel)
            view.addSubview(bar.priorTitleLabel)
            bar.realBar.frame = CGRect(x: 0, y: view.frame.height - 20, width: view.frame.width, height: 20)
            bar.currentTitleLabel.frame = CGRect(x: 375 / 2, y: view.frame.height - 20, width: 100, height: 20)
            bar.priorTitleLabel.frame = CGRect(x: 375 / 2, y: view.frame.height - 20, width: 100, height: 20)
        }
        
        interactivePopGestureRecognizer?.addTarget(self, action: #selector(handleRealBarDisplay))
    }
    
    func handleRealBarDisplay() {
        
        let currentAlpha = (interactivePopGestureRecognizer?.location(in: view).x)! / view.frame.width
        
        barCurrentTitleLabel.alpha = 1 - currentAlpha
        barPriorTitleLabel.alpha = currentAlpha
        
    }
    
}

extension TiptoesNavController: UINavigationBarDelegate {
    
    public func navigationBar(_ navigationBar: UINavigationBar, shouldPush item: UINavigationItem) -> Bool {
        return true
    }
    
    public func navigationBar(_ navigationBar: UINavigationBar, didPush item: UINavigationItem) {
        
        if let pushTitle = item.title {
            barCurrentTitleLabel.text = pushTitle
        }
    }
    
    public func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        barPriorTitleLabel.isHidden = false
        if let popTitle = viewControllers[0].title {
            barPriorTitleLabel.text = popTitle
        }
        return true
    }
    
    public func navigationBar(_ navigationBar: UINavigationBar, didPop item: UINavigationItem) {
        barCurrentTitleLabel.text = barPriorTitleLabel.text
        barCurrentTitleLabel.alpha = 1.0
        
        barPriorTitleLabel.isHidden = true
        
    }
}

class TiptoesNavBar: UINavigationBar {
    
    var currentTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = UIColor.black
        label.text = "HOME"
        return label
    }()
    
    var priorTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = UIColor.black
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
