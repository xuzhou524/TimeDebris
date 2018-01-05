//
//  HomeSampleView.swift
//  TimeDebris
//
//  Created by gozap on 2018/1/5.
//  Copyright © 2018年 com.longdai. All rights reserved.
//

import UIKit

class HomeSampleView: UIView {
    
    let iconImageView : UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage.init(named: "image1")
        return iconImageView
    }()

//    let addImageView : UIImageView = {
//        let addImageView = UIImageView()
//        addImageView.layer.shadowOpacity = 0.8
//        addImageView.layer.shadowColor = XZSwiftColor.xzGlay129.cgColor
//        addImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
//        addImageView.layer.shadowRadius = 5
//        addImageView.layer.cornerRadius = 30;
//        addImageView.image = UIImage.init(named: "tianjia")
//        addImageView.backgroundColor = XZSwiftColor.white
//        return addImageView
//    }()
//
//    let liebiaoImageView : UIImageView = {
//        let liebiaoImageView = UIImageView()
//        liebiaoImageView.image = UIImage.init(named: "liebiao")
//        return liebiaoImageView
//    }()
//
//    let userImageView : UIImageView = {
//        let userImageView = UIImageView()
//        userImageView.image = UIImage.init(named: "user")
//        return userImageView
//    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = XZClient.XZFont2(size: 18)
        titleLabel.textColor = XZSwiftColor.xzGlay50
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    let englishLabel: UILabel = {
        let englishLabel = UILabel()
        englishLabel.font = XZClient.XZFont2(size: 15)
        englishLabel.textColor = XZSwiftColor.xzGlay50
        englishLabel.numberOfLines = 2
        englishLabel.textAlignment = .center
        return englishLabel
    }()
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: XZClient.ScreenWidth(), height: 0))
        self.backgroundColor = XZSwiftColor.white
        self.addSubview(iconImageView)
        iconImageView.snp.makeConstraints({ (make) -> Void in
            make.bottom.equalTo(self).offset(-100)
            make.left.right.top.equalTo(self)
        });
        
        self.addSubview(titleLabel)
        titleLabel.text = "拾掇生活中的点滴,记录时光的故事"
        titleLabel.snp.makeConstraints({ (make) -> Void in
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.top.equalTo(iconImageView.snp.bottom).offset(20)
        });
        
        self.addSubview(englishLabel)
        englishLabel.text = "Tidy up a little life, record the story of time"
        englishLabel.snp.makeConstraints({ (make) -> Void in
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.bottom.equalTo(self).offset(-20)
        });
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
