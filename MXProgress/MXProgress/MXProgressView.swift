 //
 //  MXProgressView.swift
 //  MXProgress
 //
 //  Created by 李茂轩 on 15/3/5.
 //  Copyright (c) 2015年 lee. All rights reserved.
 //
 
 import UIKit
 
 
 public enum MXProgressType{
    
    case Circle // This type can Elastic zoom in or Elastic zoom out
    case Normal  // This is a normal scale animation
    
    
    
 }
 
 class MXProgressView: UIView {
    
    var mxProgressType: MXProgressType!
    var mxProgress : CGFloat! {
        
        
        didSet{
            
            if (mxProgress <= 0) {
                self.mxProgressLayer.frame = CGRectMake(0, 0, 0, mxProgrssViewHeight)
            }else if (mxProgress <= 1 ) {
                
                self.mxProgressLayer.frame = CGRectMake(0, 0, mxProgress * mxProgressViewWidth, mxProgrssViewHeight)
            }else{
                self.mxProgressLayer.frame = CGRectMake(0, 0, mxProgressViewWidth, mxProgrssViewHeight)
            }
            
            
        }
        
    }
    
    
    var mxProgressLayer : CALayer!
    var mxProgressViewBackViewColor : UIColor!
        { didSet { self.backgroundColor = mxProgressViewBackViewColor } }
    
    var mxProgressViewColor : UIColor! { didSet{ self.mxProgressLayer.backgroundColor = mxProgressViewColor.CGColor } }
    var mxProgressViewWidth : CGFloat!
    
    var mxProgrssViewHeight : CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setUp()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
        fatalError("init(coder:) has not been implemented")
        
    }
    convenience init (progressViewBackViewColor:UIColor,progressViewColor:UIColor,progressType:MXProgressType) {
        self.init(frame:CGRectZero)
        

        mxProgressType = progressType
        mxProgressViewBackViewColor = progressViewBackViewColor
        backgroundColor = mxProgressViewBackViewColor
        mxProgressViewColor = progressViewColor
        mxProgressLayer.backgroundColor = mxProgressViewColor.CGColor
        
        
    }
    
    
    private  func setUp(){
        mxProgressLayer = CALayer()
        
        self.layer.addSublayer(mxProgressLayer)
        //    mxProgress = 0
        
        print("")
    }
    
    // require!!
    func installCompotent(){
        switch self.mxProgressType! {
            //        case .
        case .Normal :
            normalProgress()
            
        case .Circle :
            circleProgress()
            
        default:
            break;
            
            
            
            
            
        }
        
    }
    
    
    func normalProgress(){
        
        
        layoutIfNeeded()
        mxProgrssViewHeight =  self.frame.size.height
        mxProgressViewWidth = self.frame.size.width
        mxProgressLayer.frame = CGRectMake(0, 0, 0, mxProgrssViewHeight)
        
        
        
    }
    
    func circleProgress(){
    
    layoutIfNeeded()
        
    
    
    
    }
    
    
    
    
 }
