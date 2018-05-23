//
//  RootViewController.swift
//  TimeDebris
//
//  Created by gozap on 2017/12/29.
//  Copyright © 2017年 com.longdai. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = XZSwiftColor.backgroundColor
        
        let homeSampleView = HomeSampleView()
        homeSampleView.backgroundColor = XZSwiftColor.white
        self.view.addSubview(homeSampleView)
        homeSampleView.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(self.view).offset(90);
            make.left.equalTo(self.view).offset(40)
            make.right.equalTo(self.view).offset(-40)
            make.bottom.equalTo(self.view).offset(-140)
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
//        let transition = CATransition()
//        transition.duration = 0.4
//        transition.type = kCATransitionMoveIn
//        transition.subtype = kCATransitionFromLeft
//        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(ListViewController(), animated: true)
    }
    
    @objc func homeTapToUserAction() {
//        let transition = CATransition()
//        transition.duration = 0.4
//        transition.type = kCATransitionMoveIn
//        transition.subtype = kCATransitionFromRight
//        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(UserViewController(), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

