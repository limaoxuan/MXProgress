//
//  ViewController.swift
//  MXProgress
//
//  Created by 李茂轩 on 15/3/5.
//  Copyright (c) 2015年 lee. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var mxProgress : MXProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        mxProgress = MXProgressView(progressViewBackViewColor: RED(), progressViewColor: BLACK(),progressType: MXProgressType.Rect)
        
        
        mxProgress = MXProgressView(progressViewBackViewColor: CLEAR(), progressViewColor: BLACK(), progressType: MXProgressType.Circle)
        
        
        mxProgress.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(mxProgress)
        
        
        
        
        
        let locationH = "H:|-10-[mxProgress(200)]"
        let locationV = "V:|-20-[mxProgress(200)]"
        let mxProgressDic = ["mxProgress":mxProgress]
        
        setConstraintsWithStringHandVWithCurrentView(locationH, locationV, self.view, mxProgressDic)
        
        mxProgress.installCompotent()
        
        
        let  delayInSeconds = 2.0;
        
        var minutes = 1 * Double(NSEC_PER_SEC)
        
        var dtime = dispatch_time(DISPATCH_TIME_NOW, Int64(minutes))
        dispatch_after(dtime, dispatch_get_main_queue()) { () -> Void in
            
            
            
            self.layerAnimation()
            
        }
        
    }
    
    func layerAnimation()->Void {
        
        self.mxProgress.mxNormalProgress = 0.8
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

