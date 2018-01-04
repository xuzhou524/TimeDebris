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
        
        let imageView = UIImageView.init(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:320))
        imageView.image = UIImage.init(named: "image1")
        self.view.addSubview(imageView)
        
        let addImageView = UIImageView.init(frame: CGRect(x:UIScreen.main.bounds.size.width/2.0 - 30, y:UIScreen.main.bounds.size.height - 60 - 60, width:60, height:60))
        addImageView.image = UIImage.init(named: "tianjia")
        self.view.addSubview(addImageView)
        
        let liebiaoImageView = UIImageView.init(frame: CGRect(x:30, y:UIScreen.main.bounds.size.height - 25 - 30, width:25, height:25))
        liebiaoImageView.image = UIImage.init(named: "liebiao")
        self.view.addSubview(liebiaoImageView)
        
        let userImageView = UIImageView.init(frame: CGRect(x:UIScreen.main.bounds.size.width - 25 - 30, y:UIScreen.main.bounds.size.height - 25 - 30, width:25, height:25))
        userImageView.image = UIImage.init(named: "user")
        self.view.addSubview(userImageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

