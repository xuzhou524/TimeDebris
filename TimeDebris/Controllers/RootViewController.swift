//
//  RootViewController.swift
//  TimeDebris
//
//  Created by gozap on 2017/12/29.
//  Copyright © 2017年 com.longdai. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    var  titleStr: String? = "时光音乐电台"
    var  author: String? = "如念"
    var  dynasty: String? = ""
    
    var  homeSampleView = HomeSampleView()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Thread.sleep(forTimeInterval: 3.0)
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = XZSwiftColor.backgroundColor
        
        self.homeSampleView.backgroundColor = XZSwiftColor.white
        self.view.addSubview(self.homeSampleView)
        self.homeSampleView.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(self.view).offset(105);
            make.left.equalTo(self.view).offset(35)
            make.right.equalTo(self.view).offset(-35)
            make.bottom.equalTo(self.view).offset(-145)
        });
        
        let appNameImageView = UIImageView()
        appNameImageView.image = UIImage.init(named: "appName")
        appNameImageView.isUserInteractionEnabled = true
        self.view.addSubview(appNameImageView)
        appNameImageView.snp.makeConstraints({ (make) -> Void in
            make.bottom.equalTo(self.homeSampleView.snp.top).offset(-30);
            make.left.equalTo(self.homeSampleView)
            make.width.equalTo(95)
            make.height.equalTo(22)
        });
        
        let homeTapView = HomeTapView()
        homeTapView.backgroundColor = XZSwiftColor.backgroundColor
        self.view.addSubview(homeTapView)
        homeTapView.snp.makeConstraints({ (make) -> Void in
            make.left.right.bottom.equalTo(self.view)
            make.height.equalTo(110)
        });
        let addTapAction = UITapGestureRecognizer.init(target: self, action: #selector(RootViewController.homeTapToAddAction))
        homeTapView.addImageView.addGestureRecognizer(addTapAction)
        
        let listTapAction = UITapGestureRecognizer.init(target: self, action: #selector(RootViewController.homeTapToListAction))
        homeTapView.liebiaoImageView.addGestureRecognizer(listTapAction)
        
        let userTapAction = UITapGestureRecognizer.init(target: self, action: #selector(RootViewController.homeTapToUserAction))
        homeTapView.userImageView.addGestureRecognizer(userTapAction)
    }
    
    @objc func homeTapToAddAction() {
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = kCATransitionMoveIn
        transition.subtype = kCATransitionFromTop
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(EditorViewController(), animated: false)
    }
    
    @objc func homeTapToListAction() {
        self.navigationController?.pushViewController(ListViewController(), animated: true)
    }
    
    @objc func homeTapToUserAction() {
        self.navigationController?.pushViewController(UserViewController(), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

