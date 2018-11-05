//
//  ListViewController.swift
//  TimeDebris
//
//  Created by gozap on 2018/3/16.
//  Copyright © 2018年 com.longdai. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var cacheLoanNoteArray: NSMutableArray?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = XZSwiftColor.backgroundColor
        tableView.separatorStyle = .none
        return tableView
    }()
    
    deinit {
        /// 移除通知
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = XZSwiftColor.black
        self.navigationController?.navigationBar.isHidden = true
        
        self.cacheLoanNoteArray = UserDefaults.standard.getCustomObject(forKey: "kTMCacheLoanManage") as? NSMutableArray
        
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
        
        let titleLabel = UILabel()
        titleLabel.text = "随时"
        titleLabel.textColor = XZSwiftColor.generalOverallColor
        titleLabel.font = XZClient.XZFont2(size: 18)
        headTapView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) -> Void in
            make.centerX.equalTo(headTapView)
            make.centerY.equalTo(backImageView)
        });
        let tapAction = UITapGestureRecognizer.init(target: self, action: #selector(ListViewController.backActionClick))
        backImageView.addGestureRecognizer(tapAction)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(headTapView.snp.bottom)
            make.left.right.bottom.equalTo(self.view)
        });
        
        regClass(self.tableView, cell: ListTableViewCell.self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ListViewController.notificationClick), name: NSNotification.Name(rawValue:"isTest"), object: nil)
        self.setUpNotification()
        iCloudHandle.queryCloudKitData()
    
    }
    
    func setUpNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(ListViewController.finishedGetNewCloudData), name: NSNotification.Name(rawValue:"CloudDataQueryFinished"), object: nil)
    }
    
    @objc func finishedGetNewCloudData(notification:NSNotification){
        DispatchQueue.main.async(execute: {
            self.cacheLoanNoteArray = notification.userInfo?["key"] as? NSMutableArray
            self.tableView.reloadData()
        })
    }

    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.cacheLoanNoteArray == nil || self.cacheLoanNoteArray?.count == 0 {
            return 1
        }
        return (self.cacheLoanNoteArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.cacheLoanNoteArray == nil || self.cacheLoanNoteArray?.count == 0 {
            return 350
        }
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.cacheLoanNoteArray == nil || self.cacheLoanNoteArray?.count == 0 {
            
            let cell: UITableViewCell? = UITableViewCell.init(style: .default, reuseIdentifier: "nullCell")
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            cell?.contentView.backgroundColor = XZSwiftColor.backgroundColor
            
            let label = UILabel()
            label.font = XZClient.XZFont2(size: 15)
            label.textColor = XZSwiftColor.white
            label.text = " - 时刻记录你的生活 -"
            cell?.contentView.addSubview(label)
            label.snp.makeConstraints({ (make) -> Void in
                make.center.equalTo((cell?.contentView)!)
            });
            return cell!
        }
        
        let userHeadCell = getCell(tableView, cell: ListTableViewCell.self, indexPath: indexPath)
        
        userHeadCell.shanChuView?.tag = (indexPath as NSIndexPath).row + 100
        let tapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(ListViewController.deleteLocalNotes(_:)))
        userHeadCell.shanChuView!.addGestureRecognizer(tapGestureRecognizer)
        
        userHeadCell.bgScrollView?.tag = (indexPath as NSIndexPath).row + 1000
        let scrollViewRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(ListViewController.selectModel(_:)))
        userHeadCell.bgScrollView!.addGestureRecognizer(scrollViewRecognizer)
        
        let loanModel = self.cacheLoanNoteArray![indexPath.row] as! LoanCacheManage
        userHeadCell.titleLabel?.text = loanModel.titleStr

        let timeInterval:TimeInterval = TimeInterval(Int(loanModel.timeStr!)!)
        let date = Date(timeIntervalSince1970: timeInterval)
        //格式话输出
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy.MM.dd HH:mm"
        
        userHeadCell.dateLabel?.text = dformatter.string(from: date)
        
        return userHeadCell
    }
    
    @objc func deleteLocalNotes(_ tap:UITapGestureRecognizer){
        self.cacheLoanNoteArray?.removeObject(at: ((tap.view?.tag)! - 100))
        UserDefaults.standard.saveCustomObject(customObject: self.cacheLoanNoteArray!, key: "kTMCacheLoanManage")
        self.tableView.reloadData()
    }
    
    @objc func selectModel(_ tap:UITapGestureRecognizer){
        let loanModel = self.cacheLoanNoteArray![((tap.view?.tag)! - 1000)] as! LoanCacheManage
        let  detailVC = DetailViewController()
        detailVC.loanCacheModel = loanModel
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc func backActionClick() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func notificationClick() {
        self.cacheLoanNoteArray = UserDefaults.standard.getCustomObject(forKey: "kTMCacheLoanManage") as? NSMutableArray
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
