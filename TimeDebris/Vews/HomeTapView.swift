//
//  HomeTapView.swift
//  TimeDebris
//
//  Created by gozap on 2018/1/4.
//  Copyright © 2018年 com.longdai. All rights reserved.
//

import UIKit

class HomeTapView: UIView {
    let iconImageView : UIImageView = {
        let iconImageView = UIImageView()
        //iconImageView.backgroundColor = XZSwiftColor.red
        return iconImageView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = XZClient.XZFont2(size: 14)
        titleLabel.textColor = XZSwiftColor.xzGlay50
        return titleLabel
    }()

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: XZClient.ScreenWidth()/4.0, height: 80))
        self.addSubview(iconImageView)
        iconImageView.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(self).offset(15)
            make.centerX.equalTo(self)
            make.width.height.equalTo(40)
        });
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) -> Void in
            make.centerX.equalTo(iconImageView)
            make.top.equalTo(iconImageView.snp.bottom).offset(10)
        });
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
