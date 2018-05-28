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
        self.dateLabel?.font = XZClient.XZFont2(size: 14)
        self.dateLabel?.textColor = XZSwiftColor.backgroundColor
        self.contentView.addSubview(self.dateLabel!)
        self.dateLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.iconImageView!).offset(20)
            make.bottom.equalTo(self.iconImageView!).offset(-20)
        })
        
        self.titleLabel = UILabel()
        self.titleLabel?.font = XZClient.XZFont2(size: 14)
        self.titleLabel?.textColor = XZSwiftColor.backgroundColor
        self.contentView.addSubview(self.titleLabel!)
        self.titleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.iconImageView!).offset(20)
            make.bottom.equalTo((self.dateLabel?.snp.top)!).offset(-15)
        })
    }
}

class DetailTableViewCell: UITableViewCell {
    var summeryLabel : UILabel?
    var dateLabel : UILabel?
    
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

        self.summeryLabel = UILabel()
        self.summeryLabel?.font = XZClient.XZFont2(size: 15)
        self.summeryLabel?.numberOfLines = 0
        self.summeryLabel?.textColor = XZSwiftColor.white
        self.contentView.addSubview(self.summeryLabel!)
        self.summeryLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.contentView).offset(15)
            make.right.equalTo(self.contentView).offset(-15)
            make.top.equalTo(self.contentView).offset(20)
        })
        self.summeryLabel?.lineBreakMode = .byWordWrapping
        
        self.dateLabel = UILabel()
        self.dateLabel?.text = "2018.03.20";
        self.dateLabel?.font = XZClient.XZFont2(size: 14)
        self.dateLabel?.textColor = XZSwiftColor.white
        self.contentView.addSubview(self.dateLabel!)
        self.dateLabel?.snp.makeConstraints({ (make) in
            make.right.equalTo(self.contentView).offset(-15)
            make.top.equalTo((self.summeryLabel?.snp.bottom)!).offset(30)
        })
    }
}

