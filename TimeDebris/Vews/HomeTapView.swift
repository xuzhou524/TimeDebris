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
        addImageView.layer.shadowOpacity = 0.5
        addImageView.layer.shadowColor = XZSwiftColor.generalOverallColor.cgColor
        addImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        addImageView.layer.shadowRadius = 2
        addImageView.layer.cornerRadius = 25;
        addImageView.image = UIImage.init(named: "tianjia")?.withRenderingMode(.alwaysTemplate)
        addImageView.tintColor = XZSwiftColor.generalOverallColor
        addImageView.isUserInteractionEnabled = true
        return addImageView
    }()
    
    let liebiaoImageView : UIImageView = {
        let liebiaoImageView = UIImageView()
        liebiaoImageView.image = UIImage.init(named: "liebiao")?.withRenderingMode(.alwaysTemplate)
        liebiaoImageView.tintColor = XZSwiftColor.generalOverallColor
        liebiaoImageView.isUserInteractionEnabled = true
        return liebiaoImageView
    }()
    
    let userImageView : UIImageView = {
        let userImageView = UIImageView()
        userImageView.image = UIImage.init(named: "user")?.withRenderingMode(.alwaysTemplate)
        userImageView.tintColor = XZSwiftColor.generalOverallColor
        userImageView.isUserInteractionEnabled = true
        return userImageView
    }()

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: XZClient.ScreenWidth(), height: 80))
        self.addSubview(addImageView)
        addImageView.snp.makeConstraints({ (make) -> Void in
            make.bottom.equalTo(self).offset(-35)
            make.centerX.equalTo(self)
            make.width.height.equalTo(50)
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
