//
//  EditorViewController.swift
//  TimeDebris
//
//  Created by gozap on 2018/3/16.
//  Copyright © 2018年 com.longdai. All rights reserved.
//

import UIKit

class EditorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = XZSwiftColor.white
        
        self.navigationController?.navigationBar.isHidden = true
        
        let tableView = UITableView()
        tableView.backgroundColor = XZSwiftColor.xzGlay230
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints({ (make) -> Void in
            make.left.right.bottom.top.equalTo(self.view)
        });
        
        let headTapView = UIView()
        headTapView.backgroundColor = XZSwiftColor.clear
        self.view.addSubview(headTapView)
        headTapView.snp.makeConstraints({ (make) -> Void in
            make.left.right.top.equalTo(self.view)
            make.height.equalTo(64)
        });
        
        let backImageView = UIImageView()
        backImageView.image = UIImage.init(named: "guanbi")
        backImageView.isUserInteractionEnabled = true
        headTapView.addSubview(backImageView)
        backImageView.snp.makeConstraints({ (make) -> Void in
            make.left.equalTo(headTapView).offset(20)
            make.centerY.equalTo(headTapView).offset(12)
            make.width.height.equalTo(21)
        });
        let tapAction = UITapGestureRecognizer.init(target: self, action: #selector(UserViewController.backActionClick))
        backImageView.addGestureRecognizer(tapAction)
        
    }
    @objc func backActionClick() {
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
