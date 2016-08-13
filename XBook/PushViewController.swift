//
//  PushViewController.swift
//  XBook
//
//  Created by dongqian on 16/8/3.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class PushViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var dataArray = NSMutableArray()
    var tableView:UITableView?
    var navigationView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.setNavigationBar()
        
        tableView = UITableView(frame: self.view.frame)
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(self.tableView!)
        tableView?.registerClass(PushBookCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView?.tableFooterView = UIView()
        
        tableView?.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: Selector("headerRefresh"))
        tableView?.mj_footer = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: Selector("footerRefresh"))
        
        tableView?.mj_header.beginRefreshing()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationView.hidden = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationView.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setNavigationBar(){
        navigationView = UIView(frame: CGRectMake(0,-20,SCREEN_WIDTH,65))
        navigationView.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.addSubview(navigationView)
        
        let addBookBtn = UIButton(frame: CGRectMake(20,20,SCREEN_WIDTH,45))
        addBookBtn.setImage(UIImage(named: "plus"), forState: .Normal)
        addBookBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        addBookBtn.setTitle("新建书评", forState: .Normal)
        
        addBookBtn.contentHorizontalAlignment = .Left
        addBookBtn.addTarget(self, action: Selector("pushNewBook"), forControlEvents: .TouchUpInside)
        navigationView.addSubview(addBookBtn)
    }
    
    func pushNewBook(){
        let vc = PushNewBookController()
        GeneralFactory.addTitle(vc,leftTitle: "取消",rightTitle: "发布")
        self.presentViewController(vc, animated: true){ () -> Void in
        }
       
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? PushBookCell
        let dict = dataArray[indexPath.row] as? AVObject
        cell?.bookName?.text = "《"+(dict!["bookName"] as! String)+"》"+(dict!["bookTitle"] as! String)
        cell?.editor?.text = "作者："+(dict!["bookEditor"] as! String)
        let date = dict!["createdAt"] as? NSDate
        let format = NSDateFormatter()
        format.dateFormat = "yyyy-MM-dd hh:mm"
        cell?.more?.text = format.stringFromDate(date!)
        
        let coverFile = dict!["bookCover"] as? AVFile
        cell?.cover?.sd_setImageWithURL(NSURL(string:(coverFile?.url)!), placeholderImage: UIImage(named: "1"))
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let vc = BookDetailViewController()
        vc.bookDetail = dataArray[indexPath.row] as? AVObject
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func headerRefresh(){
        let query = AVQuery(className: "Book")
        query.orderByDescending("createdAt")
        query.limit = 20
        query.skip = 0
        query.whereKey("user", equalTo: AVUser.currentUser())
        query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
            self.tableView?.mj_header.endRefreshing()
            self.dataArray.removeAllObjects()
            self.dataArray.addObjectsFromArray(results)
            self.tableView?.reloadData()
        }
    }
    
    func footerRefresh(){
        let query = AVQuery(className: "Book")
        query.orderByDescending("createdAt")
        query.limit = 20
        query.skip = self.dataArray.count
        query.whereKey("user", equalTo: AVUser.currentUser())
        query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
            self.tableView?.mj_footer.endRefreshing()
            self.dataArray.addObjectsFromArray(results)
            self.tableView?.reloadData()
        }
    }
}
