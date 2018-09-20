//
//  DetailViewController.swift
//  TimeDebris
//
//  Created by gozap on 2018/5/28.
//  Copyright © 2018年 com.longdai. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var loanCacheModel : LoanCacheManage?
    var titleLabel : UILabel?
    
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
        
        self.titleLabel = UILabel()
        self.titleLabel!.text = self.loanCacheModel?.titleStr
        self.titleLabel!.textColor = XZSwiftColor.generalOverallColor
        self.titleLabel!.font = XZClient.XZFont2(size: 18)
        headTapView.addSubview(self.titleLabel!)
        self.titleLabel!.snp.makeConstraints({ (make) -> Void in
            make.centerX.equalTo(headTapView)
            make.centerY.equalTo(backImageView)
        });
        
        let editorButton = UIButton()
        editorButton.setBackgroundImage(UIImage.init(named: "editor")?.withRenderingMode(.alwaysTemplate), for: .normal)
        editorButton.tintColor = XZSwiftColor.generalOverallColor
        editorButton.setTitleColor(XZSwiftColor.generalOverallColor, for: .normal)
        headTapView.addSubview(editorButton)
        editorButton.snp.makeConstraints({ (make) -> Void in
            make.right.equalTo(headTapView).offset(-15)
            make.centerY.equalTo(headTapView).offset(10)
            make.width.height.equalTo(22)
        });
        
        let tapAction = UITapGestureRecognizer.init(target: self, action: #selector(DetailViewController.backActionClick))
        backImageView.addGestureRecognizer(tapAction)
        
        editorButton.addTarget(self, action: #selector(DetailViewController.editorActionClick), for: .touchUpInside)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints({ (make) -> Void in
            make.top.equalTo(headTapView.snp.bottom)
            make.left.right.bottom.equalTo(self.view)
        });
        
        regClass(self.tableView, cell: DetailTableViewCell.self)
        
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return XZClient.ScreenHeight()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailCell = getCell(tableView, cell: DetailTableViewCell.self, indexPath: indexPath)
        
        let attributedString:NSMutableAttributedString = NSMutableAttributedString(string: (self.loanCacheModel?.detailsStr)!)
        let paragraphStyle:NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10 //大小调整
        paragraphStyle.firstLineHeadIndent = 30; 
        attributedString.addAttribute(kCTParagraphStyleAttributeName as NSAttributedStringKey, value: paragraphStyle, range: NSMakeRange(0, (self.loanCacheModel?.detailsStr)!.Lenght))
        detailCell.summeryLabel?.attributedText = attributedString

        
        let timeInterval:TimeInterval = TimeInterval(Int((self.loanCacheModel?.timeStr!)!)!)
        let date = Date(timeIntervalSince1970: timeInterval)
        //格式话输出
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy.MM.dd HH:mm"
        detailCell.dateLabel?.text = dformatter.string(from: date)
        
        return detailCell
    }
    
    @objc func backActionClick() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func editorActionClick() {
        weak var weakSelf = self;
        let editorVC = EditorViewController()
        editorVC.editorNotes = loanCacheModel
        editorVC.callback = { (model : LoanCacheManage) -> () in
            weakSelf!.loanCacheModel = model
            weakSelf!.titleLabel!.text = model.titleStr
            weakSelf?.tableView.reloadData()
        }
        self.navigationController?.pushViewController(editorVC, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
