//
//  TitleTableViewCell.swift
//  MortgageCalculator-Swift
//
//  Created by gozap on 2017/8/3.
//  Copyright © 2017年 com.longdai. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    var titleLabel: UILabel?
    var detaileLabel: UILabel?
    var iconImageView: UIImageView?
    var linView : UIView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.sebView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.sebView()
    }
    func sebView() ->Void{
        self.selectionStyle = .none
        
        self.titleLabel = UILabel()
        self.titleLabel?.text = "用易房贷";
        self.titleLabel?.font = XZClient.XZFont2(size: 15)
        self.titleLabel?.textColor = XZSwiftColor.backgroundColor
        self.contentView.addSubview(self.titleLabel!)
        self.titleLabel?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(self.contentView).offset(15)
        })
        
        self.iconImageView = UIImageView();
        self.iconImageView?.image = UIImage(named: "arrow_right")
        self.contentView.addSubview(self.iconImageView!)
        self.iconImageView?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(self.contentView).offset(-15)
            make.height.equalTo(12)
            make.width.equalTo(12)
        })
        
        self.detaileLabel = UILabel()
        self.detaileLabel?.text = "v1.0.0"
        self.detaileLabel?.textColor = XZSwiftColor.backgroundColor
        self.detaileLabel?.font = XZClient.XZFont2(size: 15)
        self.detaileLabel?.textAlignment = .right;
        self.contentView.addSubview(self.detaileLabel!)
        self.detaileLabel!.snp.makeConstraints({ (make) -> Void in
            make.right.equalTo((self.iconImageView?.snp.left)!).offset(-5)
            make.centerY.equalTo(self.contentView)
        });
        
        self.linView = UIView()
        self.linView?.backgroundColor = XZSwiftColor.xzGlay230
        self.contentView.addSubview(self.linView!)
        self.linView?.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(0.4);
            make.right.equalTo(self.contentView)
            make.left.equalTo(self.contentView).offset(15)
            make.bottom.equalTo(self.contentView)
        }
    }
}

class UserHeadTableViewCell: UITableViewCell {
    var titleLabel: UILabel?
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
        self.selectionStyle = .none
        
        self.iconImageView = UIImageView();
        self.iconImageView?.image = UIImage(named: "UserHead.jpeg")
        self.contentView.addSubview(self.iconImageView!)
        self.iconImageView?.snp.makeConstraints({ (make) in
            make.top.left.right.bottom.equalTo(self.contentView)
        })
        
        self.titleLabel = UILabel()
        self.titleLabel?.text = "拾掇生活中的点滴,记录时光的故事";
        self.titleLabel?.textColor = XZSwiftColor.backgroundColor
        self.titleLabel?.font = XZClient.XZFont2(size: 16)
        self.contentView.addSubview(self.titleLabel!)
        self.titleLabel?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self.contentView).offset(25)
            make.centerX.equalTo(self.contentView)
        })
    }
}

