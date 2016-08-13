//
//  BookDetailView.swift
//  XBook
//
//  Created by dongqian on 16/8/9.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class BookDetailView: UIView {

    var VIEW_WIDTH:CGFloat!
    var VIEW_HEIGHT:CGFloat!
    
    var bookName:UILabel?
    var editor:UILabel?
    var userName:UILabel?
    var date:UILabel?
    var more:UILabel?
    var cover:UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.VIEW_WIDTH = frame.size.width
        self.VIEW_HEIGHT = frame.size.height
        self.backgroundColor = UIColor.whiteColor()
        
        cover = UIImageView(frame: CGRectMake(8,8,(VIEW_HEIGHT-16)/1.273,VIEW_HEIGHT-16))
        self.addSubview(cover!)
        bookName = UILabel(frame:CGRectMake((VIEW_HEIGHT-16)/1.273+16,8,VIEW_WIDTH-(VIEW_HEIGHT-16)/1.273-16,VIEW_HEIGHT/4))
        bookName?.font = UIFont(name: "System", size: 18)
        self.addSubview(bookName!)
        editor = UILabel(frame:CGRectMake((VIEW_HEIGHT-16)/1.273+16,8+VIEW_HEIGHT/4,VIEW_WIDTH-(VIEW_HEIGHT-16)/1.273-16,VIEW_HEIGHT/4))
        editor?.font = UIFont(name: "System", size: 18)
        self.addSubview(editor!)
        userName = UILabel(frame:CGRectMake((VIEW_HEIGHT-16)/1.273+16,8+VIEW_HEIGHT/4+VIEW_HEIGHT/6,VIEW_WIDTH-(VIEW_HEIGHT-16)/1.273-16,VIEW_HEIGHT/6))
        userName?.font = UIFont(name: "System", size: 13)
        //userName?.textColor = RGB(35,g:87,b:139)
        self.addSubview(userName!)
        date = UILabel(frame:CGRectMake((VIEW_HEIGHT-16)/1.273+16,8+VIEW_HEIGHT/4+VIEW_HEIGHT/6*2,80,VIEW_HEIGHT/6))
        date?.font = UIFont(name: "System", size: 13)
        date?.textColor = UIColor.grayColor()
        self.addSubview(date!)
        more = UILabel(frame:CGRectMake((VIEW_HEIGHT-16)/1.273+16,8+VIEW_HEIGHT/4+VIEW_HEIGHT/6*3,VIEW_WIDTH-(VIEW_HEIGHT-16)/1.273-16,VIEW_HEIGHT/6))
        more?.font = UIFont(name: "System", size: 13)
        more?.textColor = UIColor.grayColor()
        self.addSubview(more!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        let context  = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 0.5)
        CGContextSetRGBStrokeColor(context, 231/255, 231/255, 231/255, 1)
        CGContextMoveToPoint(context, 8, VIEW_HEIGHT-2)
        CGContextAddLineToPoint(context, VIEW_WIDTH-8, VIEW_HEIGHT-2)
        CGContextStrokePath(context)
    }


}
