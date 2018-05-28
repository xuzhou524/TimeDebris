//
//  ListTableViewCell.swift
//  TimeDebris
//
//  Created by gozap on 2018/3/20.
//  Copyright © 2018年 com.longdai. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    var titleLabel: UILabel?
    var dateLabel : UILabel?
    var iconImageView: UIImageView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.sebView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.sebView()
    }
    func sebView() ->Void{
        self.contentView.backgroundColor = XZSwiftColor.backgroundColor
        self.selectionStyle = .none
        
        self.iconImageView = UIImageView();
        self.iconImageView?.backgroundColor = XZSwiftColor.white
        self.iconImageView?.layer.cornerRadius = 3
        self.contentView.addSubview(self.iconImageView!)
        self.iconImageView?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.contentView).offset(5)
            make.left.equalTo(self.contentView).offset(15)
            make.right.equalTo(self.contentView).offset(-15)
            make.bottom.equalTo(self.contentView).offset(-10)
        })
        
        self.dateLabel = UILabel()
        self.dateLabel?.text = "2018年03月20日";
        self.dateLabel?.font = XZClient.XZFont2(size: 14)
        self.contentView.addSubview(self.dateLabel!)
        self.dateLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.iconImageView!).offset(15)
            make.bottom.equalTo(self.iconImageView!).offset(-15)
        })
        
        self.titleLabel = UILabel()
        self.titleLabel?.text = "拾掇生活中的点滴,记录时光的故事";
        self.titleLabel?.font = XZClient.XZFont2(size: 14)
        self.contentView.addSubview(self.titleLabel!)
        self.titleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.iconImageView!).offset(15)
            make.bottom.equalTo((self.dateLabel?.snp.top)!).offset(-10)
        })
    }
}

