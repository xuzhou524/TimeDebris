//
//  ListViewController.swift
//  TimeDebris
//
//  Created by gozap on 2018/3/16.
//  Copyright © 2018年 com.longdai. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

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
        headTapView.backgroundColor = XZSwiftColor.white
        self.view.addSubview(headTapView)
        headTapView.snp.makeConstraints({ (make) -> Void in
            make.left.right.top.equalTo(self.view)
            make.height.equalTo(64)
        });
        
        let backImageView = UIImageView()
        backImageView.backgroundColor = XZSwiftColor.red
        backImageView.isUserInteractionEnabled = true
        headTapView.addSubview(backImageView)
        backImageView.snp.makeConstraints({ (make) -> Void in
            make.left.equalTo(headTapView).offset(15)
            make.centerY.equalTo(headTapView).offset(11)
            make.height.equalTo(28)
            make.width.equalTo(25)
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
