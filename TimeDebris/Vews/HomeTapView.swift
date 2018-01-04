//
//  HomeTapView.swift
//  TimeDebris
//
//  Created by gozap on 2018/1/4.
//  Copyright © 2018年 com.longdai. All rights reserved.
//

import UIKit

class HomeTapView: UIView {
    let addImageView : UIImageView = {
        let addImageView = UIImageView()
        addImageView.layer.shadowOpacity = 0.8
        addImageView.layer.shadowColor = XZSwiftColor.xzGlay129.cgColor
        addImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        addImageView.layer.shadowRadius = 5
        addImageView.layer.cornerRadius = 30;
        addImageView.image = UIImage.init(named: "tianjia")
        addImageView.backgroundColor = XZSwiftColor.white
        return addImageView
    }()
    
    let liebiaoImageView : UIImageView = {
        let liebiaoImageView = UIImageView()
        liebiaoImageView.image = UIImage.init(named: "liebiao")
        return liebiaoImageView
    }()
    
    let userImageView : UIImageView = {
        let userImageView = UIImageView()
        userImageView.image = UIImage.init(named: "user")
        return userImageView
    }()
    
//    let titleLabel: UILabel = {
//        let titleLabel = UILabel()
//        titleLabel.font = XZClient.XZFont2(size: 14)
//        titleLabel.textColor = XZSwiftColor.xzGlay50
//        return titleLabel
//    }()

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: XZClient.ScreenWidth(), height: 80))
        self.addSubview(addImageView)
        addImageView.snp.makeConstraints({ (make) -> Void in
            make.bottom.equalTo(self).offset(-50)
            make.centerX.equalTo(self)
            make.width.height.equalTo(60)
        });
        
        self.addSubview(liebiaoImageView)
        liebiaoImageView.snp.makeConstraints({ (make) -> Void in
            make.bottom.equalTo(self).offset(-30)
            make.left.equalTo(self).offset(30)
            make.width.height.equalTo(25)
        });
        
        self.addSubview(userImageView)
        userImageView.snp.makeConstraints({ (make) -> Void in
            make.bottom.equalTo(self).offset(-30)
            make.right.equalTo(self).offset(-30)
            make.width.height.equalTo(25)
        });
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
