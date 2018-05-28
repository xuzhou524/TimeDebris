//
//  FriendshipRecommenViewController.swift
//  MortgageCalculator-Swift
//
//  Created by gozap on 2017/9/11.
//  Copyright © 2017年 com.longdai. All rights reserved.
//

import UIKit

import Crashlytics

class FriendshipRecommenViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = XZSwiftColor.backgroundColor
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let iconArray = ["longdai","v2ex","fangdai","onePai","lanyamao","tianqi"]
    let appUrlArray = ["https://itunes.apple.com/cn/app/id900365369?mt=8",
                       "https://itunes.apple.com/cn/app/id1078157349?mt=8",
                       "https://itunes.apple.com/cn/app/id1272033544?mt=8",
                       "https://itunes.apple.com/cn/app/id1239242152?mt=8",
                       "https://itunes.apple.com/cn/app/id1116575370?mt=8",
                       "https://itunes.apple.com/cn/app/id1107521185?mt=8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headTapView = UIView()
        headTapView.backgroundColor = XZSwiftColor.backgroundColor
        self.view.addSubview(headTapView)
        headTapView.snp.makeConstraints({ (make) -> Void in
            make.left.right.top.equalTo(self.view)
            make.height.equalTo(64)
        });
        
        let backImageView = UIImageView()
        backImageView.image = UIImage.init(named: "d_Arrow_left")?.withRenderingMode(.alwaysTemplate)
        backImageView.tintColor = XZSwiftColor.generalOverallColor
        backImageView.isUserInteractionEnabled = true
        headTapView.addSubview(backImageView)
        backImageView.snp.makeConstraints({ (make) -> Void in
            make.left.equalTo(headTapView).offset(15)
            make.centerY.equalTo(headTapView).offset(10)
            make.width.height.equalTo(18)
        });
        let tapAction = UITapGestureRecognizer.init(target: self, action: #selector(UserViewController.backActionClick))
        backImageView.addGestureRecognizer(tapAction)
        
        let titleLabel = UILabel()
        titleLabel.text = "开发者app集锦"
        titleLabel.textColor = XZSwiftColor.generalOverallColor
        titleLabel.font = XZClient.XZFont2(size: 18)
        headTapView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) -> Void in
            make.centerX.equalTo(headTapView)
            make.centerY.equalTo(backImageView)
        });

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(headTapView.snp.bottom)
            make.left.right.bottom.equalTo(self.view)
        });
        
        regClass(self.tableView, cell: FriendshipTableViewCell.self)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.iconArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0.4 * XZClient.ScreenWidth() + 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friendshipCell = getCell(tableView, cell: FriendshipTableViewCell.self, indexPath: indexPath)
        friendshipCell.selectionStyle = .none
        friendshipCell.iconImageView?.image = UIImage.init(named: self.iconArray[indexPath.row])
        return friendshipCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Answers.logCustomEvent(withName: self.iconArray[indexPath.row], customAttributes: [:])
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string:self.appUrlArray[indexPath.row])!, options: [:], completionHandler: nil)
        } else {
            let urlString = self.appUrlArray[indexPath.row]
            let url = NSURL(string: urlString)
            UIApplication.shared.openURL(url! as URL)
        }
    }
    
    @objc func backActionClick() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
