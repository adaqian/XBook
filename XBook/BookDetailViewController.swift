//
//  BookDetailViewController.swift
//  XBook
//
//  Created by dongqian on 16/8/9.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    var bookDetail:AVObject?
    var bookTitleView:BookDetailView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.tintColor = UIColor.grayColor()
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0,-60), forBarMetrics: .Default)
        initBookDetail()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initBookDetail(){
        bookTitleView = BookDetailView(frame:CGRectMake(0,64,SCREEN_WIDTH,SCREEN_HEIGHT/4))
        self.view.addSubview(bookTitleView!)
        
        let coverFile = bookDetail!["bookCover"] as? AVFile
        bookTitleView?.cover?.sd_setImageWithURL(NSURL(string: (coverFile?.url)!), placeholderImage: UIImage(named: "1"))
        bookTitleView?.bookName?.text = "《"+(bookDetail!["bookName"] as! String)+"》"+(bookDetail!["bookTitle"] as! String)
        bookTitleView?.editor?.text = "作者："+(bookDetail!["bookEditor"] as! String)
        
        let user = bookDetail!["user"] as? AVUser
        user?.fetchInBackgroundWithBlock({ (returnUser, error) -> Void in
            self.bookTitleView?.userName?.text = "编者："+(returnUser as! AVUser).username
        })
        let date = bookDetail!["createdAt"] as? NSDate
        let format = NSDateFormatter()
        format.dateFormat = "yyyy-MM-dd hh:mm"
        bookTitleView?.date?.text = format.stringFromDate(date!)
        
        bookTitleView?.more?.text = "66个喜欢，25个评论，12000次阅读"
    }

}
