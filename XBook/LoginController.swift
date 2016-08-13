//
//  LoginController.swift
//  XBook
//
//  Created by dongqian on 16/8/8.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var topLayout: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(sender: AnyObject) {
 
        AVUser.logInWithUsernameInBackground(self.username.text, password: self.password.text) { (user, error) -> Void in
            if error == nil{
                self.dismissViewControllerAnimated(true, completion: { () -> Void in
                    
                })
            }else{
                if error.code == 210 {
                    ProgressHUD.showError("用户名或密码错误")
                }else if error.code == 211{
                    ProgressHUD.showError("不存在该用户")
                }else if error.code == 216{
                    ProgressHUD.showError("未验证邮箱")
                }else if error.code == 1{
                    ProgressHUD.showError("操作频繁")
                }else{
                    ProgressHUD.showError("登陆失败")
                }
            }
        }
    }


}
