//
//  UserViewController.swift
//  TimeDebris
//
//  Created by gozap on 2018/3/16.
//  Copyright © 2018年 com.longdai. All rights reserved.
//

import UIKit
import StoreKit
import GoogleMobileAds

class UserViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var backImgHeight = XZClient.ScreenWidth()
    var backImgWidth = XZClient.ScreenWidth()
    var bannerView: GADBannerView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    let bgHeadImageView : UIImageView = {
        let bgHeadImageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: XZClient.ScreenWidth(), height: XZClient.ScreenWidth()))
        bgHeadImageView.image = UIImage.init(named: "bg-mine")
        return bgHeadImageView
    }()
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = XZSwiftColor.clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let headView : UIView = {
        let headView = UIView.init(frame: CGRect(x: 0, y: 0, width: XZClient.ScreenWidth(), height: 218))
        headView.backgroundColor = XZSwiftColor.clear

        return headView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = XZSwiftColor.white
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.addSubview(self.bgHeadImageView)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(self.view).offset(-20)
            make.left.right.bottom.equalTo(self.view)
        });
        
        self.tableView.tableHeaderView = self.headView
        
        let titleLabel = UILabel()
        titleLabel.text = "拾掇生活中的点滴,记录时光的故事";
        titleLabel.textColor = XZSwiftColor.backgroundColor
        titleLabel.font = XZClient.XZFont2(size: 16)
        self.headView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self.headView)
            make.centerX.equalTo(self.headView)
        })
        
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
        regClass(self.tableView, cell: More_InterTableViewCell.self)
        
        bannerView = GADBannerView.init(frame: CGRect(x: 0,  y: XZClient.ScreenHeight() - 60, width: XZClient.ScreenWidth(), height: 50))
        bannerView.adSize = kGADAdSizeBanner
        bannerView.center.x = self.view.center.x
        self.view.addSubview(bannerView)
        self.view.bringSubview(toFront: bannerView)
        bannerView.adUnitID = "ca-app-pub-9353975206269682/2091512965"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
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
            return 100
        }else if (indexPath as NSIndexPath).row == 1 {
            return 15
        }else if (indexPath as NSIndexPath).row == 4 {
            return 0
        }
        return 55
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath as NSIndexPath).row == 0 {
            let interCell = getCell(tableView, cell: More_InterTableViewCell.self, indexPath: indexPath)
            interCell.zanImageView?.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(UserViewController.zanImageViewTap)))
            interCell.tuImageView?.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(UserViewController.tuImageView)))
            interCell.selectionStyle = .none
            return interCell
        }else if (indexPath as NSIndexPath).row == 1 {
            let cell = UITableViewCell()
            cell.backgroundColor = XZSwiftColor.white
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
            baseCell.titleLabel?.text = "推荐给记友"
            baseCell.detaileLabel?.text = ""
        }else if (indexPath as NSIndexPath).row == 4 {
            baseCell.titleLabel?.text = "开发者app集锦"
            baseCell.detaileLabel?.text = ""
        }else if (indexPath as NSIndexPath).row == 5 {
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
        if indexPath.row == 3 {
            self.share()
        }else if indexPath.row == 4 {
            let friendVC = FriendshipRecommenViewController()
            self.navigationController?.pushViewController(friendVC, animated: true);
        }
    }
    
    func share()  {
        // 1.创建分享参数
        let shareParames = NSMutableDictionary()
        shareParames.ssdkSetupShareParams(byText: "拾掇生活中的点滴\n记录时光的故事",
                                          images : UIImage(named: "Icon-60"),
                                          url : NSURL(string:"https://itunes.apple.com/cn/app/id1330908170") as URL?,
                                          title : "随时笔记 - 时刻记录你的生活",
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
            SKStoreReviewController.requestReview()
        }else if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string:"https://itunes.apple.com/cn/app/id1330908170")!, options: [:], completionHandler: nil)
        } else {
            let urlString = "https://itunes.apple.com/cn/app/id1330908170"
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsety = scrollView.contentOffset.y
        if contentOffsety < 0 {
            var rect = self.bgHeadImageView.frame
            rect.size.height = self.backImgHeight - contentOffsety
            rect.size.width = self.backImgWidth * (self.backImgHeight - contentOffsety) / self.backImgHeight
            rect.origin.x = -(rect.size.width - self.backImgWidth) / 2.0
            rect.origin.y = 0
            self.bgHeadImageView.frame = rect
        }else{
            var rect = self.bgHeadImageView.frame
            rect.size.height = XZClient.ScreenWidth()
            rect.size.width = XZClient.ScreenWidth()
            rect.origin.x = 0
            rect.origin.y = -contentOffsety
            self.bgHeadImageView.frame = rect
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
