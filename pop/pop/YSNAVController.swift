//
//  YSNAVController.swift
//  pop
//
//  Created by lihe on 2017/9/7.
//  Copyright © 2017年 lihe. All rights reserved.
//

import UIKit

class YSNAVController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 1.使用运行时, 打印手势中所有属性
        guard let targets = interactivePopGestureRecognizer!.value(forKey:  "_targets") as? [NSObject] else { return }
        
        print(targets)
        
        let targetObjc = targets[0]
        let target = targetObjc.value(forKey: "target")
        let action = Selector(("handleNavigationTransition:"))
        
        
        let panGes = UIPanGestureRecognizer(target: target, action: action)
        self.view.addGestureRecognizer(panGes)
        

    }
    
    func test0() {
        var count: UInt32 = 0
        let ivars =  class_copyIvarList(UIGestureRecognizer.self, &count)
        for i in 0 ..< count {
            
            let ivar = ivars![Int(i)]
            let cname = ivar_getName(ivar)
            let stringname = String(cString: cname!, encoding: .utf8)!
            print(stringname)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
    }

}
