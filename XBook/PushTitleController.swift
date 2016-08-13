//
//  PushTitleController.swift
//  XBook
//
//  Created by dongqian on 16/8/5.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

typealias PushTitleCallBack = (title:String) -> Void

class PushTitleController: UIViewController {

    var textField:UITextField?
    
    var callback:PushTitleCallBack?
    /**
     实现回调
     1.block
     2.delegate
     3.通知 NSNotification
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.textField = UITextField(frame: CGRectMake(15,60,SCREEN_WIDTH-30,30))
        self.textField?.borderStyle = .RoundedRect
        self.textField?.placeholder = "书评标题"
        self.textField?.font = UIFont(name: "System", size: 15)
        self.view.addSubview(self.textField!)
        
        self.textField?.becomeFirstResponder()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func close(){
        self.dismissViewControllerAnimated(true){ () -> Void in
            
        }
    }
    
    func confirm(){
        self.callback?(title:self.textField!.text!)
        close()
    }
}
