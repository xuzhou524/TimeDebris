//
//  ViewController.swift
//  TimeDebris
//
//  Created by gozap on 2017/12/29.
//  Copyright © 2017年 com.longdai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = XZSwiftColor.xzGlay230
        
        let imageView = UIImageView.init(frame: CGRect(x:30, y:60, width:XZClient.ScreenWidth() - 60, height:XZClient.ScreenHeight() - 60 - 110 - 50))
        imageView.image = UIImage.init(named: "image1")
        self.view.addSubview(imageView)
        
        let homeTapView = HomeTapView()
        homeTapView.backgroundColor = XZSwiftColor.white
        self.view.addSubview(homeTapView)
        homeTapView.snp.makeConstraints({ (make) -> Void in
            make.left.right.bottom.equalTo(self.view)
            make.height.equalTo(130)
        });
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

