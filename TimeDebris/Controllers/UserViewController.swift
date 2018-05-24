//
//  UserViewController.swift
//  TimeDebris
//
//  Created by gozap on 2018/3/16.
//  Copyright © 2018年 com.longdai. All rights reserved.
//

import UIKit

class UserViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = XZSwiftColor.white
        tableView.separatorStyle = .none
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = XZSwiftColor.white
        self.navigationController?.navigationBar.isHidden = true
        
        self.tableView.delegate = self
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
        backImageView.image = UIImage.init(named: "d_Arrow_left")?.withRenderingMode(.alwaysTemplate)
        backImageView.tintColor = XZSwiftColor.white
        backImageView.isUserInteractionEnabled = true
        headTapView.addSubview(backImageView)
        backImageView.snp.makeConstraints({ (make) -> Void in
            make.left.equalTo(headTapView).offset(15)
            make.centerY.equalTo(headTapView).offset(10)
            make.width.height.equalTo(18)
        });
        let tapAction = UITapGestureRecognizer.init(target: self, action: #selector(UserViewController.backActionClick))
        backImageView.addGestureRecognizer(tapAction)
        
        regClass(self.tableView, cell: TitleTableViewCell.self)
        regClass(self.tableView, cell: UserHeadTableViewCell.self)
        regClass(self.tableView, cell: More_InterTableViewCell.self)
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath as NSIndexPath).row == 0 {
            return 200
        }else if (indexPath as NSIndexPath).row == 1 {
            return 110
        }else if (indexPath as NSIndexPath).row == 2 {
            return 15
        }
        return 55
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath as NSIndexPath).row == 0 {
            let userHeadCell = getCell(tableView, cell: UserHeadTableViewCell.self, indexPath: indexPath)
            return userHeadCell
        }else if (indexPath as NSIndexPath).row == 1 {
            let interCell = getCell(tableView, cell: More_InterTableViewCell.self, indexPath: indexPath)
            interCell.zanImageView?.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(UserViewController.zanImageViewTap)))
            interCell.tuImageView?.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(UserViewController.tuImageView)))
            interCell.selectionStyle = .none
            return interCell
        }else if (indexPath as NSIndexPath).row == 2 {
            let cell = UITableViewCell()
            cell.backgroundColor = XZSwiftColor.white
            cell.selectionStyle = .none
            return cell
        }
        
        let baseCell = getCell(tableView, cell: TitleTableViewCell.self, indexPath: indexPath)
        baseCell.clipsToBounds = true
        baseCell.iconImageView?.isHidden = false
        if (indexPath as NSIndexPath).row == 3 {
            baseCell.titleLabel?.text = "新浪微博"
            baseCell.detaileLabel?.text = "徐_Aaron"
        }else if (indexPath as NSIndexPath).row == 4 {
            baseCell.titleLabel?.text = "推荐给记友"
            baseCell.detaileLabel?.text = ""
        }else if (indexPath as NSIndexPath).row == 5 {
            baseCell.titleLabel?.text = "开发者app集锦"
            baseCell.detaileLabel?.text = ""
        }else if (indexPath as NSIndexPath).row == 6 {
            baseCell.titleLabel?.text = "随时笔记"
            let infoDict = Bundle.main.infoDictionary
            if let info = infoDict {
                // app版本
                let appVersion = info["CFBundleShortVersionString"] as! String?
                baseCell.detaileLabel?.text = "v" + appVersion!
                baseCell.iconImageView?.isHidden = true
            }
        }
        return baseCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4 {
            self.share()
        }else if indexPath.row == 5 {
            let friendVC = FriendshipRecommenViewController()
            self.navigationController?.pushViewController(friendVC, animated: true);
        }
    }
    
    func share()  {
        // 1.创建分享参数
        let shareParames = NSMutableDictionary()
        shareParames.ssdkSetupShareParams(byText: "拾掇生活中的点滴,记录时光的故事" + "  http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1272033544&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8",
                                          images : UIImage(named: "Icon-60"),
                                          url : NSURL(string:"http://www.xzzai.com") as URL?,
                                          title : "随时笔记",
                                          type : SSDKContentType.auto)
        
        SSUIShareActionSheetStyle.setShareActionSheetStyle(.simple)
        //2.进行分享
        _ = ShareSDK.showShareActionSheet(nil, items: nil, shareParams: shareParames) { (state : SSDKResponseState, platformType : SSDKPlatformType, userdata : [AnyHashable : Any]?, contentEnity : SSDKContentEntity?, error : Error?, end) in
            
            switch state{
                
            case SSDKResponseState.success: print("分享成功")
            case SSDKResponseState.fail:    print("分享失败,错误描述:\(String(describing: error))")
            case SSDKResponseState.cancel:  print("分享取消")
                
            default:
                break
            }
        }
    }
    
    @objc func zanImageViewTap(){
        if #available(iOS 10.3, *) {
            #if DEBUG
            #else
            SKStoreReviewController.requestReview()
            #endif
        }else if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string:"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1272033544&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8")!, options: [:], completionHandler: nil)
        } else {
            let urlString = "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1272033544&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8"
            let url = NSURL(string: urlString)
            UIApplication.shared.openURL(url! as URL)
        }
    }
    @objc func tuImageView(){
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string:"mqq://im/chat?chat_type=wpa&uin=1043037904&version=1&src_type=web")!, options: [:], completionHandler: nil)
        } else {
            let urlString = "mqq://im/chat?chat_type=wpa&uin=1043037904&version=1&src_type=web"
            let url = NSURL(string: urlString)
            UIApplication.shared.openURL(url! as URL)
        }
    }
    
    @objc func backActionClick() {
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
