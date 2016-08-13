//
//  RankViewController.swift
//  XBook
//
//  Created by dongqian on 16/8/3.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class RankViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        if AVUser.currentUser() == nil{
            let story = UIStoryboard(name: "Login", bundle: nil)
            let loginVC = story.instantiateViewControllerWithIdentifier("login")
            self.presentViewController(loginVC, animated: true, completion: { () -> Void in
                
            })
        }
        
        
        let label = UILabel(frame: CGRectMake(0,0,200,20))
        label.center = self.view.center
        label.textAlignment = NSTextAlignment.Center
        label.adjustsFontSizeToFitWidth = true
        //label.font = UIFont(name:"Bauhaus ITC",size:14)
        label.text = "haha i am ada!!"
        label.textColor = UIColor.blackColor()
        self.view.addSubview(label)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
