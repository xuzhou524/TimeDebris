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

class More_InterTableViewCell: UITableViewCell {
    var zanImageView: UIImageView?
    var zanLabel: UILabel?
    
    var tuImageView: UIImageView?
    var tuLabel: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:reuseIdentifier)
        self.sebView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.sebView()
    }
    
    func sebView(){
        self.contentView.backgroundColor = XZSwiftColor.xzGlay230
        self.selectionStyle = .none
        
        let oneView = UIView()
        oneView.backgroundColor = XZSwiftColor.white
        self.contentView.addSubview(oneView)
        oneView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.contentView)
            make.bottom.equalTo(self.contentView).offset(-10)
            make.top.equalTo(self.contentView).offset(10)
            make.right.equalTo(self.contentView.snp.centerX).offset(-0.5)
        }
        
        self.zanImageView = UIImageView()
        self.zanImageView!.layer.cornerRadius = 15.0;
        self.zanImageView?.isUserInteractionEnabled = true
        self.zanImageView?.image = UIImage(named: "about_praise")
        oneView.addSubview(self.zanImageView!)
        self.zanImageView?.snp.makeConstraints({ (make) -> Void in
            make.centerX.equalTo(oneView)
            make.top.equalTo(oneView).offset(15);
            make.width.height.equalTo(35)
        });
        
        self.zanLabel = UILabel()
        self.zanLabel?.text = "点个赞"
        self.zanLabel?.font = XZClient.XZFont2(size: 15)
        oneView.addSubview(self.zanLabel!)
        self.zanLabel?.snp.makeConstraints({ (make) -> Void in
            make.centerX.equalTo(oneView)
            make.top.equalTo((self.zanImageView?.snp.bottom)!).offset(10)
        });
        
        let linView = UIView()
        linView.backgroundColor = XZSwiftColor.xzGlay230
        self.contentView.addSubview(linView)
        linView.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.contentView)
            make.width.equalTo(0.5)
            make.top.equalTo(self.contentView).offset(10)
            make.bottom.equalTo(self.contentView).offset(-10)
        }
        
        let twoView = UIView()
        twoView.backgroundColor = XZSwiftColor.white
        self.contentView.addSubview(twoView)
        twoView.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(self.contentView)
            make.bottom.equalTo(self.contentView).offset(-10)
            make.top.equalTo(self.contentView).offset(10)
            make.left.equalTo(self.contentView.snp.centerX).offset(0.5)
        }
        
        self.tuImageView = UIImageView()
        self.tuImageView!.layer.cornerRadius = 15.0;
        self.tuImageView?.isUserInteractionEnabled = true
        self.tuImageView?.image = UIImage(named: "about_criticism")
        twoView.addSubview(self.tuImageView!)
        self.tuImageView?.snp.makeConstraints({ (make) -> Void in
            make.centerX.equalTo(twoView)
            make.top.equalTo(twoView).offset(15);
            make.width.height.equalTo(35)
        });
        
        self.tuLabel = UILabel()
        self.tuLabel?.text = "吐个槽"
        self.tuLabel?.font = XZClient.XZFont2(size: 15)
        twoView.addSubview(self.tuLabel!)
        self.tuLabel?.snp.makeConstraints({ (make) -> Void in
            make.centerX.equalTo(twoView)
            make.top.equalTo((self.tuImageView?.snp.bottom)!).offset(10)
        });
    }
}

