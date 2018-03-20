//
//  UserViewController.swift
//  TimeDebris
//
//  Created by gozap on 2018/3/16.
//  Copyright © 2018年 com.longdai. All rights reserved.
//

import UIKit

class UserViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = XZSwiftColor.xzGlay230
        tableView.separatorStyle = .none
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = XZSwiftColor.white
        self.navigationController?.hidesBottomBarWhenPushed = true
        
        self.tableView.delegate = self
        self.tableView.backgroundColor = XZSwiftColor.convenientBackgroundColor
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(self.view).offset(-20)
            make.left.right.bottom.equalTo(self.view)
        });
        
        let headTapView = UIView()
        headTapView.backgroundColor = XZSwiftColor.clear
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
        
        regClass(self.tableView, cell: TitleTableViewCell.self)
        regClass(self.tableView, cell: UserHeadTableViewCell.self)
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath as NSIndexPath).row == 0 {
            return 170
        }else if (indexPath as NSIndexPath).row == 1 {
            return 15
        }
        return 55
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath as NSIndexPath).row == 0 {
            let userHeadCell = getCell(tableView, cell: UserHeadTableViewCell.self, indexPath: indexPath)
            return userHeadCell
        }else if (indexPath as NSIndexPath).row == 1 {
            let cell = UITableViewCell()
            cell.backgroundColor = XZSwiftColor.convenientBackgroundColor
            cell.selectionStyle = .none
            return cell
        }
        
        let baseCell = getCell(tableView, cell: TitleTableViewCell.self, indexPath: indexPath)
        baseCell.clipsToBounds = true
        baseCell.iconImageView?.isHidden = false
        if (indexPath as NSIndexPath).row == 2 {
            baseCell.titleLabel?.text = "新浪微博"
            baseCell.detaileLabel?.text = "徐_Aaron"
        }else if (indexPath as NSIndexPath).row == 3 {
            baseCell.titleLabel?.text = "推荐给贷友"
            baseCell.detaileLabel?.text = ""
        }else if (indexPath as NSIndexPath).row == 4 {
            baseCell.titleLabel?.text = "为你发现"
            baseCell.detaileLabel?.text = ""
        }else if (indexPath as NSIndexPath).row == 5 {
            baseCell.titleLabel?.text = "微印笔记"
            let infoDict = Bundle.main.infoDictionary
            if let info = infoDict {
                // app版本
                let appVersion = info["CFBundleShortVersionString"] as! String!
                baseCell.detaileLabel?.text = "v" + appVersion!
                baseCell.iconImageView?.isHidden = true
            }
        }
        return baseCell
    }
    
    
    @objc func backActionClick() {
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
