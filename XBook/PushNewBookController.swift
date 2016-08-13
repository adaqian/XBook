//
//  PushNewBookController.swift
//  XBook
//
//  Created by dongqian on 16/8/3.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class PushNewBookController: UIViewController,BookTitleDelegate,PhotoPickerDelegate,VPImageCropperDelegate,
    UITableViewDelegate,UITableViewDataSource{
    
    var bookTitle:BookTitleView?
    var tableView:UITableView?
    var titleArray:Array<String> = []
    var book_Title:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.bookTitle = BookTitleView(frame: CGRectMake(0,40,SCREEN_WIDTH,160))
        self.bookTitle?.delegate = self
        self.view.addSubview(self.bookTitle!)
        
        self.tableView = UITableView(frame: CGRectMake(0,200, SCREEN_WIDTH, SCREEN_HEIGHT-200), style: .Grouped)
        //使没有内容的线消失
        self.tableView?.tableFooterView = UIView()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView?.backgroundColor = UIColor(colorLiteralRed: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        self.view.addSubview(self.tableView!)
        
        self.titleArray = ["标题","评分","分类","书评"]
        
        //注册通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("pushBookNotification:"), name: "pushBookNotification", object: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func pushBookNotification(notification:NSNotification){
        let dict = notification.userInfo
        if String(dict!["success"]!) == "true"{
            ProgressHUD.showSuccess("上传成功")
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
                
            })
        }else{
            ProgressHUD.showError("上传失败")
        }
    }
    
    func choiceCover() {
        print("choice cover")
        let vc = PhotoPickerViewController()
        vc.delegate = self
        self.presentViewController(vc, animated: true){ () -> Void in
        }
    }
    
    func getImageFromPicker(image:UIImage){
        //self.bookTitle?.bookCover?.setImage(image, forState: .Normal)
        let croVC = VPImageCropperViewController(image: image, cropFrame: CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_WIDTH*1.273), limitScaleRatio: 3)
        croVC.delegate = self
        self.presentViewController(croVC, animated: true){ () -> Void in
        }

    }

    
    func close(){
        self.dismissViewControllerAnimated(true){ () -> Void in
            
        }
    }
    
    func confirm(){
        let dict:NSDictionary = [
            "bookName":(self.bookTitle?.bookName?.text)!,
            "bookEditor":(self.bookTitle?.bookEditor?.text)!,
            "bookCover":(self.bookTitle?.bookCover?.currentImage)!,
            "bookTitle":self.book_Title!,
            "type":"1",
            "description":""
        ]
        PushBook.pushBookInBackground(dict)
    }
    
    //VPImageDelegate
    func imageCropperDidCancel(cropperViewController: VPImageCropperViewController!) {
        cropperViewController.dismissViewControllerAnimated(true){ () -> Void in
        }
    }
    
    func imageCropper(cropperViewController: VPImageCropperViewController!, didFinished editedImage: UIImage!) {
        self.bookTitle?.bookCover?.setImage(editedImage, forState: .Normal)
        cropperViewController.dismissViewControllerAnimated(true){ () -> Void in
        }


    }
    //UITableViewDelegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "cell")
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        if indexPath.row != 1{
            cell.accessoryType = .DisclosureIndicator//jiashang jiantou
            
        }
        cell.textLabel?.text = self.titleArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: "System", size: 15)
        cell.detailTextLabel?.font = UIFont(name: "System", size: 15)
        switch indexPath.row{
        case 0:cell.detailTextLabel?.text = self.book_Title
        case 1:break
        case 2:break
        case 3:break
        default:break
        }
        //cell.editingAccessoryType = .DetailButton
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row{
        case 0:
            self.tableViewSelectTitle()
        case 1:
            self.tableViewSelectScore()
        case 2:
            self.tableViewSelectType()
        case 3:
            self.tableviewSelectDescription()
        default:break
        }
    }
    
    func tableViewSelectTitle(){
        let vc = PushTitleController()
        GeneralFactory.addTitle(vc)
        vc.callback = ({(title:String) -> Void in
            self.book_Title = title
            self.tableView?.reloadData()
        })
        self.presentViewController(vc, animated: true){ () -> Void in
        }
    }
    
    func tableViewSelectScore(){
        
    }
    
    func tableViewSelectType(){
        let vc = PushTypeController()
        GeneralFactory.addTitle(vc)
        self.presentViewController(vc, animated: true){ () -> Void in
        }
    }
    
    func tableviewSelectDescription(){
        
    }
    
}
