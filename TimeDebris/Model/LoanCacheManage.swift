//
//  LoanCacheManage.swift
//  TimeDebris
//
//  Created by gozap on 2018/5/21.
//  Copyright © 2018年 com.longdai. All rights reserved.
//

import UIKit

class LoanCacheManage: NSObject , NSCoding {
    var  titleStr : String?               //笔记标题
    var  detailsStr : String?             //笔记内容
    var  iconImageViewUrlStr : String?    //背景图片
    var  timeStr :String?                 //保存时间   13位时间戳
    
    required override init(){
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        if aDecoder.containsValue(forKey: "titleStr") {
            self.titleStr = aDecoder.decodeObject(forKey: "titleStr") as? String
        }
        if aDecoder.containsValue(forKey: "detailsStr") {
            self.detailsStr = aDecoder.decodeObject(forKey: "detailsStr") as? String
        }
        if aDecoder.containsValue(forKey: "iconImageViewUrlStr") {
            self.iconImageViewUrlStr = aDecoder.decodeObject(forKey: "iconImageViewUrlStr") as? String
        }
        if aDecoder.containsValue(forKey: "timeStr") {
            self.timeStr = aDecoder.decodeObject(forKey: "timeStr") as? String
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.titleStr, forKey: "titleStr")
        aCoder.encode(self.detailsStr, forKey: "detailsStr")
        aCoder.encode(self.iconImageViewUrlStr, forKey: "iconImageViewUrlStr")
        aCoder.encode(self.timeStr, forKey: "timeStr")
    }
}
