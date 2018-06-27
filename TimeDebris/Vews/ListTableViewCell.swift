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
    
    var bgScrollView: UIScrollView?
    var shanChuView: UIView?
    
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
        
        let hight: CGFloat = 110
        
        self.bgScrollView = UIScrollView.init(frame:CGRect(x: 15, y: 5, width: UIScreen.main.bounds.size.width - 30,  height: hight - 10))
        self.bgScrollView?.backgroundColor = XZSwiftColor.white
        self.bgScrollView!.contentSize = CGSize(width: UIScreen.main.bounds.size.width + 70, height: hight - 10)
        self.bgScrollView?.isPagingEnabled = true
        self.bgScrollView?.scrollsToTop = false
        self.bgScrollView?.isUserInteractionEnabled = true
        self.bgScrollView?.showsHorizontalScrollIndicator = false
        self.bgScrollView?.layer.borderWidth = 0.5
        self.bgScrollView!.layer.cornerRadius = 3.0;
        self.bgScrollView?.layer.borderColor = XZSwiftColor.white.cgColor
        self.contentView.addSubview(self.bgScrollView!)
        
        let bagBGview = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 30,  height: hight - 10))
        bagBGview.backgroundColor = XZSwiftColor.white
        self.bgScrollView?.addSubview(bagBGview)
        self.bgScrollView?.sendSubview(toBack: bagBGview)
        
        self.iconImageView = UIImageView();
        self.iconImageView?.backgroundColor = XZSwiftColor.white
        self.iconImageView?.layer.cornerRadius = 3
        bagBGview.addSubview(self.iconImageView!)
        self.iconImageView?.snp.makeConstraints({ (make) in
            make.left.right.top.equalTo(bagBGview)
            make.height.equalTo(hight - 10)
        })
        
        self.dateLabel = UILabel()
        self.dateLabel?.font = XZClient.XZFont2(size: 14)
        self.dateLabel?.textColor = XZSwiftColor.backgroundColor
        bagBGview.addSubview(self.dateLabel!)
        self.dateLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.iconImageView!).offset(20)
            make.bottom.equalTo(self.iconImageView!).offset(-20)
        })
        
        self.titleLabel = UILabel()
        self.titleLabel?.font = XZClient.XZFont2(size: 14)
        self.titleLabel?.textColor = XZSwiftColor.backgroundColor
        bagBGview.addSubview(self.titleLabel!)
        self.titleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.iconImageView!).offset(20)
            make.bottom.equalTo((self.dateLabel?.snp.top)!).offset(-15)
        })
        
        self.shanChuView = UIView()
        self.shanChuView?.backgroundColor = XZSwiftColor.xzRedColor
        self.shanChuView?.isUserInteractionEnabled = true
        self.bgScrollView?.addSubview(self.shanChuView!)
        self.shanChuView?.snp.makeConstraints({ (make) -> Void in
            make.width.equalTo(hight)
            make.height.equalTo(hight)
            make.right.equalTo(self.contentView).offset(-10)
            make.top.equalTo(self.contentView)
        })
        self.bgScrollView?.sendSubview(toBack: self.shanChuView!)
        
        let shanChuLabel = UILabel()
        shanChuLabel.text = "删除"
        shanChuLabel.font = XZClient.XZFont2(size: 17)
        shanChuLabel.textColor = XZSwiftColor.white
        self.shanChuView?.addSubview(shanChuLabel)
        shanChuLabel.snp.makeConstraints { (make) -> Void in
            make.center.equalTo(self.shanChuView!)
        }
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
        self.summeryLabel?.font = XZClient.XZFont2(size: 14)
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
        self.dateLabel?.font = XZClient.XZFont2(size: 13)
        self.dateLabel?.textColor = XZSwiftColor.white
        self.contentView.addSubview(self.dateLabel!)
        self.dateLabel?.snp.makeConstraints({ (make) in
            make.right.equalTo(self.contentView).offset(-15)
            make.top.equalTo((self.summeryLabel?.snp.bottom)!).offset(30)
        })
    }
}

