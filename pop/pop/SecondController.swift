//
//  SecondController.swift
//  pop
//
//  Created by lihe on 2017/9/7.
//  Copyright © 2017年 lihe. All rights reserved.
//

import UIKit

class SecondController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white

        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        btn.backgroundColor = UIColor.red
        btn.setTitle("返回", for: .normal)
        
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(click), for: .touchUpInside)
        
    }
    
    func click() {
    
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
