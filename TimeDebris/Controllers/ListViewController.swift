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
        let tapAction = UITapGestureRecognizer.init(target: self, action: #selector(UserViewController.backActionClick))
        backImageView.addGestureRecognizer(tapAction)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(headTapView.snp.bottom)
            make.left.right.bottom.equalTo(self.view)
        });
        
        regClass(self.tableView, cell: ListTableViewCell.self)
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.cacheLoanNoteArray == nil {
            return 1
        }
        return (self.cacheLoanNoteArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.cacheLoanNoteArray == nil {
            return 350
        }
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.cacheLoanNoteArray == nil {
            
            let cell: UITableViewCell? = UITableViewCell.init(style: .default, reuseIdentifier: "nullCell")
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            cell?.contentView.backgroundColor = XZSwiftColor.backgroundColor
            
            let label = UILabel()
            label.font = XZClient.XZFont2(size: 15)
            label.textColor = XZSwiftColor.white
            label.text = " - 记录生活 记录美 -"
            cell?.contentView.addSubview(label)
            label.snp.makeConstraints({ (make) -> Void in
                make.center.equalTo((cell?.contentView)!)
            });
            return cell!
        }
        
        let userHeadCell = getCell(tableView, cell: ListTableViewCell.self, indexPath: indexPath)
        var colorArray = [XZSwiftColor.brown,XZSwiftColor.orange,XZSwiftColor.red,XZSwiftColor.yellow,XZSwiftColor.green]
        userHeadCell.iconImageView?.backgroundColor = colorArray[indexPath.row]
        
        let loanModel = self.cacheLoanNoteArray![indexPath.row] as! LoanCacheManage
        
        userHeadCell.titleLabel?.text = loanModel.titleStr
        
        let timeInterval:TimeInterval = TimeInterval(Int(loanModel.timeStr!)!)
        let date = Date(timeIntervalSince1970: timeInterval)
        //格式话输出
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm"
        
        userHeadCell.dateLabel?.text = dformatter.string(from: date)
        
        return userHeadCell
        
    }
    
    @objc func backActionClick() {
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
