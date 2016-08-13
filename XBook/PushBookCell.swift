//
//  PushBookCell.swift
//  XBook
//
//  Created by dongqian on 16/8/8.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class PushBookCell: UITableViewCell {

    var bookName:UILabel?
    var editor:UILabel?
    var more:UILabel?
    var cover:UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style:UITableViewCellStyle,reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews{
            view.removeFromSuperview()
        }
        bookName = UILabel(frame: CGRectMake(78,8,242,25))
        editor = UILabel(frame: CGRectMake(78,33,242,25))
        more = UILabel(frame: CGRectMake(78,66,242,25))
        more?.textColor = UIColor.grayColor()
        
        self.contentView.addSubview(bookName!)
        self.contentView.addSubview(editor!)
        self.contentView.addSubview(more!)
        
        self.cover = UIImageView(frame: CGRectMake(8,9,56,70))
        self.contentView.addSubview(cover!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
