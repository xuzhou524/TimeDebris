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
        iconImageView.image = UIImage.init(named: "image.jpg")
        return iconImageView
    }()

    let refreshImageView : UIImageView = {
        let refreshImageView = UIImageView()
        refreshImageView.image = UIImage.init(named: "refresh")
        return refreshImageView
    }()

    let tuPianImageView : UIImageView = {
        let tuPianImageView = UIImageView()
        tuPianImageView.image = UIImage.init(named: "tuPian")
        return tuPianImageView
    }()

    let xiaZaiImageView : UIImageView = {
        let xiaZaiImageView = UIImageView()
        xiaZaiImageView.image = UIImage.init(named: "xiaZai")
        return xiaZaiImageView
    }()
    
    let shareImageView : UIImageView = {
        let shareImageView = UIImageView()
        shareImageView.image = UIImage.init(named: "share")
        return shareImageView
    }()
    
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
            make.bottom.equalTo(self).offset(-110)
            make.left.right.top.equalTo(self)
        });
        
        self.addSubview(tuPianImageView)
        tuPianImageView.snp.makeConstraints({ (make) -> Void in
            make.bottom.equalTo(iconImageView).offset(-20)
            make.right.equalTo(iconImageView.snp.centerX).offset(-10)
            make.width.height.equalTo(20)
        });
        self.addSubview(xiaZaiImageView)
        xiaZaiImageView.snp.makeConstraints({ (make) -> Void in
            make.bottom.equalTo(tuPianImageView)
            make.left.equalTo(iconImageView.snp.centerX).offset(10)
            make.width.height.equalTo(20)
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
