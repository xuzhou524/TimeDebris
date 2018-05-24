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

    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = XZClient.XZFont2(size: 18)
        titleLabel.textColor = XZSwiftColor.backgroundColor
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    let summeryLabel: UILabel = {
        let summeryLabel = UILabel()
        summeryLabel.font = XZClient.XZFont2(size: 18)
        summeryLabel.textColor = XZSwiftColor.backgroundColor
        summeryLabel.numberOfLines = 0
        summeryLabel.textAlignment = .center
        return summeryLabel
    }()

    let authorLabel: UILabel = {
        let authorLabel = UILabel()
        authorLabel.font = XZClient.XZFont2(size: 15)
        authorLabel.textColor = XZSwiftColor.backgroundColor
        authorLabel.numberOfLines = 0
        authorLabel.textAlignment = .center
        return authorLabel
    }()
    
    let englishLabel: UILabel = {
        let englishLabel = UILabel()
        englishLabel.font = XZClient.XZFont2(size: 15)
        englishLabel.textColor = XZSwiftColor.backgroundColor
        englishLabel.numberOfLines = 2
        englishLabel.textAlignment = .center
        return englishLabel
    }()
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: XZClient.ScreenWidth(), height: 0))
        self.backgroundColor = XZSwiftColor.white
        self.layer.cornerRadius = 5
    
        self.addSubview(titleLabel)
        titleLabel.text = "拾\n掇\n生\n活\n中\n的\n点\n滴"
        titleLabel.snp.makeConstraints({ (make) -> Void in
            make.right.equalTo(self).offset(-30)
            make.top.equalTo(self).offset(30)
        });
        
        self.addSubview(summeryLabel)
        summeryLabel.text = "记\n录\n时\n光\n的\n故\n事"
        summeryLabel.snp.makeConstraints({ (make) -> Void in
            make.right.equalTo(titleLabel.snp.left).offset(-30)
            make.top.equalTo(titleLabel).offset(40)
        });
        
        self.addSubview(authorLabel)
        authorLabel.text = "|\n\n如\n念\n\n时\n光\n音\n乐\n电\n台"
        authorLabel.snp.makeConstraints({ (make) -> Void in
            make.left.equalTo(self).offset(30)
            make.bottom.equalTo(self).offset(-30)
        });

//        self.addSubview(englishLabel)
//        englishLabel.text = "Tidy up a little life, record the story of time"
//        englishLabel.snp.makeConstraints({ (make) -> Void in
//            make.left.equalTo(self).offset(10)
//            make.right.equalTo(self).offset(-10)
//            make.bottom.equalTo(self).offset(-20)
//        });
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
