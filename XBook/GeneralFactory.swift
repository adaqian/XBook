//
//  GeneralFactory.swift
//  XBook
//
//  Created by dongqian on 16/8/3.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class GeneralFactory: NSObject {
    
    static func addTitle(target:UIViewController,leftTitle:String="关闭",rightTitle:String="确认"){
        let leftBtn = UIButton(frame: CGRectMake(10,20,40,20))
        leftBtn.setTitle(leftTitle, forState: .Normal)
        leftBtn.contentHorizontalAlignment = .Left
        leftBtn.setTitleColor(MAIN_RED, forState: .Normal)
        target.view.addSubview(leftBtn)
        
        let rightBtn = UIButton(frame: CGRectMake(SCREEN_WIDTH-50,20,40,20))
        rightBtn.setTitle(rightTitle, forState: .Normal)
        rightBtn.contentHorizontalAlignment = .Right
        rightBtn.setTitleColor(MAIN_RED, forState: .Normal)
        target.view.addSubview(rightBtn)
        
        leftBtn.addTarget(target, action: Selector("close"), forControlEvents: .TouchUpInside)
        rightBtn.addTarget(target, action: Selector("confirm"), forControlEvents: .TouchUpInside)
    }
}
