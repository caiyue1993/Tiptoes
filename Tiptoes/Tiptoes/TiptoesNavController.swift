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
    
    private let tiptoesHeight = UIApplication.shared.statusBarFrame.size.height
    
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
        
        // Hide the system navigation bar
        navigationBar.isHidden = true
        
        if let bar = navigationBar as? TiptoesNavBar {
            view.addSubview(bar.tiptoes)
            view.addSubview(bar.currentTitleLabel)
            view.addSubview(bar.priorTitleLabel)
            bar.tiptoes.frame = CGRect(x: 0, y: view.frame.height - tiptoesHeight, width: view.frame.width, height: tiptoesHeight)
            bar.currentTitleLabel.sizeToFit()
            bar.currentTitleLabel.center = CGPoint(x: view.frame.width / 2, y: bar.tiptoes.center.y)
            bar.priorTitleLabel.frame = bar.currentTitleLabel.frame
        }
        interactivePopGestureRecognizer?.addTarget(self, action: #selector(handleTiptoesDisplay))
    }
    
    func handleTiptoesDisplay() {
        // You can customize the transition style here
        let currentAlpha = (interactivePopGestureRecognizer?.location(in: view).x)! / view.frame.width
        barCurrentTitleLabel.alpha = 1 - currentAlpha
        barPriorTitleLabel.alpha = currentAlpha
    }
    
}

extension TiptoesNavController: UINavigationBarDelegate {
    
    public func navigationBar(_ navigationBar: UINavigationBar, shouldPush item: UINavigationItem) -> Bool {
        barPriorTitleLabel.text = ""
        barPriorTitleLabel.isHidden = false
        return true
    }
    
    public func navigationBar(_ navigationBar: UINavigationBar, didPush item: UINavigationItem) {
        if let pushTitle = item.title {
            barCurrentTitleLabel.text = pushTitle
            barCurrentTitleLabel.sizeToFit()
            // TO DO: put label to right center position, now if the title is too long we can find that label is not at the center
        }
    }
    
    public func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        barPriorTitleLabel.isHidden = false
        // Get the former viewcontroller
        let numberOfViewControllers = viewControllers.count
        if numberOfViewControllers > 0 {
            if let popTitle = viewControllers[numberOfViewControllers - 1].title {
                barPriorTitleLabel.text = popTitle
            }
        }
        return true
    }
    
    // The status of completion of pop
    public func navigationBar(_ navigationBar: UINavigationBar, didPop item: UINavigationItem) {
        barCurrentTitleLabel.text = barPriorTitleLabel.text
        barCurrentTitleLabel.alpha = 1.0
        barPriorTitleLabel.isHidden = true
    }
}

class TiptoesNavBar: UINavigationBar {
    
    /// 用来展示当前 viewController 的 title
    var currentTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = UIColor.black
        label.text = "HOME"
        return label
    }()
    
    /// 用来展示前一页 viewController 的 title
    var priorTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = UIColor.black
        return label
    }()
    
    var tiptoes: UIView = {
        let toes = UIView()
        toes.backgroundColor = UIColor.lightGray
        return toes
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
