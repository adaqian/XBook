//
//  PushBook.swift
//  XBook
//
//  Created by dongqian on 16/8/8.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class PushBook: NSObject {
    static func pushBookInBackground(dict:NSDictionary){
        let object = AVObject(className: "Book")
        object.setObject(dict["bookName"], forKey: "bookName")
        object.setObject(dict["bookEditor"], forKey: "bookEditor")
        object.setObject(dict["bookTitle"], forKey: "bookTitle")
        object.setObject(dict["type"], forKey: "type")
        object.setObject(dict["description"], forKey: "description")
        object.setObject(AVUser.currentUser(), forKey: "user")
        
        let image = dict["bookCover"] as? UIImage
        let coverFile = AVFile(data: UIImagePNGRepresentation(image!))
        coverFile.saveInBackgroundWithBlock { (success, error) -> Void in
            if success{
                object.setObject(coverFile, forKey: "bookCover")
                object.saveInBackgroundWithBlock({ (success, error) -> Void in
                    if success{
                        print("upload sucess!")
                        NSNotificationCenter.defaultCenter().postNotificationName("pushBookNotification", object: nil, userInfo: ["success":"true"])
                    }else{
                        NSNotificationCenter.defaultCenter().postNotificationName("pushBookNotification", object: nil, userInfo: ["success":"false"])
                    }
                    
                })
            }else{
                NSNotificationCenter.defaultCenter().postNotificationName("pushBookNotification", object: nil, userInfo: ["success":"false"])
            }
        }
        


    }
}
