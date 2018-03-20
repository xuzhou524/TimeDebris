//
//  ListViewController.swift
//  TimeDebris
//
//  Created by gozap on 2018/3/16.
//  Copyright © 2018年 com.longdai. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = XZSwiftColor.xzGlay230
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
        
        let titleLabel = UILabel()
        titleLabel.text = "微印"
        titleLabel.textColor = XZSwiftColor.xzGlay50
        titleLabel.font = XZClient.XZFont2(size: 18)
        headTapView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) -> Void in
            make.centerX.equalTo(headTapView)
            make.centerY.equalTo(backImageView)
        });
        
        let tapAction = UITapGestureRecognizer.init(target: self, action: #selector(UserViewController.backActionClick))
        backImageView.addGestureRecognizer(tapAction)
        
        regClass(self.tableView, cell: ListTableViewCell.self)
        
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 170

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let userHeadCell = getCell(tableView, cell: ListTableViewCell.self, indexPath: indexPath)
        var colorArray = [XZSwiftColor.brown,XZSwiftColor.orange,XZSwiftColor.red,XZSwiftColor.yellow,XZSwiftColor.green]
        userHeadCell.iconImageView?.backgroundColor = colorArray[indexPath.row]
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
