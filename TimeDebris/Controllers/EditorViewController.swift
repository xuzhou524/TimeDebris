//
//  EditorViewController.swift
//  TimeDebris
//
//  Created by gozap on 2018/3/16.
//  Copyright © 2018年 com.longdai. All rights reserved.
//

import UIKit
import GoogleMobileAds

class EditorViewController: UIViewController,UIGestureRecognizerDelegate,UITextViewDelegate,GADBannerViewDelegate {
    var editorNotes : LoanCacheManage?
    var bannerView: GADBannerView!
//    var callback = {(editorNotes: LoanCacheManage) -> LoanCacheManage in
//        return editorNotes
//    }
    var callback:((LoanCacheManage)->())?;
    
    var describeTextView : UITextView?
    
    let headTapView : UIView = {
        let headTapView = UIView()
        headTapView.backgroundColor = XZSwiftColor.white
        return headTapView
    }()
    
    let titleTextField : UITextField = {
        let titleTextField = UITextField()
        titleTextField.placeholder = "标题"
        titleTextField.textColor = XZSwiftColor.xzGlay69
        titleTextField.font = XZClient.XZFont2(size: 16)
        return titleTextField
    }()
    
    let iconImageView : UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.layer.cornerRadius = 5
        iconImageView.clipsToBounds = true
        iconImageView.image = UIImage.init(named: "image.jpg")
        return iconImageView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.setStatusBarStyle(.default, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = XZSwiftColor.white
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.setUpHeadView()
        self.setUpEditorView()
        self.setUpToobarView()
        
        bannerView = GADBannerView.init(frame: CGRect(x: 0,  y: XZClient.ScreenHeight() - 60, width: XZClient.ScreenWidth(), height: 50))
        bannerView.adSize = kGADAdSizeBanner
        bannerView.center.x = self.view.center.x
        self.view.addSubview(bannerView)
        self.view.bringSubview(toFront: bannerView)
        bannerView.adUnitID = "ca-app-pub-9353975206269682/8518703400"
        bannerView.rootViewController = self
        bannerView.delegate = self

        let request = GADRequest()
        bannerView.load(request)
    }

    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print(error)
    }
    
    func setUpHeadView() {
        
        self.view.addSubview(self.headTapView)
        self.headTapView.snp.makeConstraints({ (make) -> Void in
            make.left.right.top.equalTo(self.view)
            make.height.equalTo(64)
        });
        
        let titleLabel = UILabel()
        titleLabel.text = "随时留下"
        titleLabel.textColor = XZSwiftColor.backgroundColor
        titleLabel.font = XZClient.XZFont2(size: 18)
        self.headTapView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) -> Void in
            make.centerX.equalTo(self.headTapView)
            make.centerY.equalTo(self.headTapView).offset(10)
        });
    }
    
    func setUpToobarView() {
        let tapView = UIView()
        tapView.backgroundColor = XZSwiftColor.clear
        self.view.addSubview(tapView)
        tapView.snp.makeConstraints({ (make) -> Void in
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-70)
            make.height.equalTo(130)
        });
        
        let backImageView = UIImageView()
        backImageView.image = UIImage.init(named: "guanbi")?.withRenderingMode(.alwaysTemplate)
        backImageView.tintColor = XZSwiftColor.backgroundColor
        backImageView.isUserInteractionEnabled = true
        tapView.addSubview(backImageView)
        backImageView.snp.makeConstraints({ (make) -> Void in
            make.center.equalTo(tapView)
            make.width.height.equalTo(25)
        });
        let tapAction = UITapGestureRecognizer.init(target: self, action: #selector(UserViewController.backActionClick))
        backImageView.addGestureRecognizer(tapAction)
    }
    
    func setUpEditorView() {
        self.view.addSubview(self.titleTextField)
        self.titleTextField.snp.makeConstraints({ (make) -> Void in
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.top.equalTo(self.headTapView.snp.bottom).offset(10)
            make.height.equalTo(50)
        });
        
        let calendarImageView = UIImageView()
        calendarImageView.tintColor = XZSwiftColor.backgroundColor
        calendarImageView.isUserInteractionEnabled = true
        self.view.addSubview(calendarImageView)
        calendarImageView.snp.makeConstraints({ (make) -> Void in
            make.left.equalTo(self.titleTextField)
            make.top.equalTo(self.titleTextField.snp.bottom).offset(15)
            make.width.height.equalTo(25)
        });
        let dateFormatter:DateFormatter = DateFormatter();
        dateFormatter.dateFormat = "dd";
        let dateString:String = dateFormatter.string(from: Date())
        calendarImageView.image = UIImage.init(named: "Calendar_" + dateString)?.withRenderingMode(.alwaysTemplate)
        
        self.describeTextView = UITextView()
        self.describeTextView?.text = "写下你的描述"
        self.describeTextView?.font = XZClient.XZFont2(size: 16)
        self.describeTextView?.textColor = XZSwiftColor.xzGlay190
        self.describeTextView?.delegate = self;
        self.view.addSubview(self.describeTextView!)
        self.describeTextView?.snp.makeConstraints({ (make) -> Void in
            make.left.right.equalTo(self.titleTextField).offset(-5)
            make.top.equalTo(calendarImageView.snp.bottom).offset(20)
            make.height.equalTo(200)
        });
        
        self.view.addSubview(self.iconImageView)
        self.iconImageView.snp.makeConstraints({ (make) -> Void in
            make.left.right.equalTo(self.titleTextField)
            make.top.equalTo((self.describeTextView?.snp.bottom)!).offset(15)
            make.height.equalTo(0)
        });
        
        let saveButton = UIButton()
        saveButton.backgroundColor = XZSwiftColor.backgroundColor
        saveButton.layer.cornerRadius = 20
        saveButton.setTitle("保存", for: .normal)
        saveButton.setTitleColor(XZSwiftColor.generalOverallColor, for: .normal)
        self.view.addSubview(saveButton)
        saveButton.snp.makeConstraints({ (make) -> Void in
            make.centerX.equalTo(self.view)
            make.top.equalTo((self.describeTextView?.snp.bottom)!).offset(40)
            make.width.equalTo(200)
            make.height.equalTo(40)
        });
        saveButton.addTarget(self, action: #selector(EditorViewController.saveClick), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTap))
        self.view.addGestureRecognizer(tap)
        tap.delegate = self
        
        
        if editorNotes != nil {
            self.titleTextField.text = editorNotes?.titleStr
            self.describeTextView?.text = editorNotes?.detailsStr
            saveButton.setTitle("保存修改", for: .normal)
        }
    }
    
    @objc func saveClick(){
        let titleStr = self.titleTextField.text
        if (titleStr?.Lenght)! <= 0 {
            return
        }
        let describeStr = self.describeTextView?.text
        if (describeStr?.Lenght)! <= 0 {
            return
        }
        self.view.endEditing(true)
        
        let loanModel = LoanCacheManage.init()
        
        loanModel.titleStr = self.titleTextField.text
        loanModel.detailsStr = self.describeTextView?.text
        
        let timeInterval:TimeInterval = NSDate().timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        loanModel.timeStr = String(timeStamp)
        
        var loanModelArray = UserDefaults.standard.getCustomObject(forKey: "kTMCacheLoanManage") as? NSMutableArray
        if (loanModelArray == nil) {
            loanModelArray = NSMutableArray()
            loanModelArray?.add(loanModel)
        }else{
            if editorNotes != nil {
                let legh = loanModelArray?.count ?? 0
                for i in 0..<legh {
                    let tempModel = loanModelArray?[i] as! LoanCacheManage
                    if ((editorNotes?.titleStr == tempModel.titleStr)  && (editorNotes?.detailsStr == tempModel.detailsStr) && (editorNotes?.timeStr == tempModel.timeStr)){
                        loanModelArray?.remove(tempModel as Any)
                        break
                    }
                }
            }
            loanModelArray?.insert(loanModel, at: 0)
        }
        UserDefaults.standard.saveCustomObject(customObject: loanModelArray!, key: "kTMCacheLoanManage")
        if callback != nil {
            callback!(loanModel)
        }
        NotificationCenter.default.post(name: NSNotification.Name("isTest"), object: self, userInfo: nil)
        self.backActionClick()
    }
    
    @objc func viewTap(){
        self.view.endEditing(true)
    }
    
    @objc func backActionClick() {
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromBottom
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.popViewController(animated: false)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "写下你的描述" {
            textView.text = ""
            self.describeTextView?.textColor = XZSwiftColor.xzGlay69
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == ""{
            textView.text = "写下你的描述"
            self.describeTextView?.textColor = XZSwiftColor.xzGlay190
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
