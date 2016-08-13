//
//  RegisterController.swift
//  XBook
//
//  Created by dongqian on 16/8/8.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerUser(sender: AnyObject) {
        print("in register")
        let user = AVUser()
        user.username = self.username.text
        user.password = self.password.text
        user.email = self.email.text
        user.signUpInBackgroundWithBlock { (success, error) -> Void in
            if success{
                ProgressHUD.showSuccess("注册成功，请验证邮箱！")
                self.dismissViewControllerAnimated(true, completion: { () -> Void in
                    
                })
            }else{
                if error.code == 125{
                    ProgressHUD.showError("邮箱不合法")
                    
                }else if error.code == 230{
                    ProgressHUD.showError("该邮箱已注册")
                }else if error.code == 202{
                    ProgressHUD.showError("用户名已存在")
                }else{
                    ProgressHUD.showError("注册失败")
                }
            }
        }
    }

    @IBAction func close(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }

}
