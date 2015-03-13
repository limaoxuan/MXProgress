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
    case Rect  // This is a normal scale animation
    
    
    
 }
 
 class MXProgressView: UIView {
    
    var mxProgressType: MXProgressType!
    
// MARK: Noraml
    var mxNormalProgress : CGFloat! {
        
        
        didSet{
            
            switch self.mxProgressType! {
            case .Rect :
                 normalProgressCurrentValue()
                
            case .Circle :
                circleProgressCurrentValue()
                
            default:
                break;

            }
            
        }
        
    }
 // MARK: Circle
    
    var mxCircleProgress : CGFloat!
    
    
    
    // MARK: Common
    
    var startValue :CGFloat!
    
    var mxProgressLine : CGFloat!
    
    
    var mxProgressLayer : CAShapeLayer!
    
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
        
        mxProgressViewColor = progressViewColor
        
        
    }
    
    
    
    
    private  func setUp(){
        mxProgressLayer = CAShapeLayer()
        
        self.layer.addSublayer(mxProgressLayer)
        //    mxProgress = 0
        
        print("")
    }
    
    // require!!
    func installCompotent(){
        switch self.mxProgressType! {
        case .Rect :
            normalProgress()
            
        case .Circle :
            circleProgress()
            
        default:
            break;
            
            
            
            
            
        }
        
    }
    
    
    func normalProgress(){
        
        
        
        getMXProgressWithAndHeight()
        mxProgressLayer.frame = CGRectMake(0, 0, 0, mxProgrssViewHeight)
        backgroundColor = mxProgressViewBackViewColor
        
        mxProgressLayer.backgroundColor = mxProgressViewColor.CGColor

        
        
    }

    
    func circleProgress(){
    
   
        getMXProgressWithAndHeight()
        mxProgressLayer.frame = CGRectMake(0, 0, mxProgressViewWidth, mxProgrssViewHeight)
        let path = UIBezierPath(ovalInRect: mxProgressLayer.bounds)
        mxProgressLayer.path = path.CGPath
        mxProgressLayer.fillColor = mxProgressViewBackViewColor.CGColor
        mxProgressLayer.strokeColor = mxProgressViewColor.CGColor
        mxProgressLayer.lineWidth = 1.0
        mxProgressLayer.strokeEnd = 0
    
    
    
    }
    /*!
    取得当前view的长度和宽度
    */
    
    func getMXProgressWithAndHeight(){
        
        layoutIfNeeded()
        mxProgrssViewHeight =  self.frame.size.height
        mxProgressViewWidth = self.frame.size.width
        
        
    }
    
    func normalProgressCurrentValue(){
    
        if (mxNormalProgress <= 0) {
            self.mxProgressLayer.frame = CGRectMake(0, 0, 0, mxProgrssViewHeight)
        }else if (mxNormalProgress <= 1 ) {
            
            self.mxProgressLayer.frame = CGRectMake(0, 0, mxNormalProgress * mxProgressViewWidth, mxProgrssViewHeight)
        }else{
            self.mxProgressLayer.frame = CGRectMake(0, 0, mxProgressViewWidth, mxProgrssViewHeight)
        }

    }
    
    func circleProgressCurrentValue(){
    
    
    
    mxProgressLayer.strokeEnd = mxNormalProgress
    
    
    }
    
    
    func startAnimation(){
    
    
    let proProgressAnimation = CABasicAnimation(keyPath: "path")
    proProgressAnimation.fromValue = 0
    proProgressAnimation.toValue = mxNormalProgress
    proProgressAnimation.duration = 3.0
        mxProgressLayer.addAnimation(proProgressAnimation, forKey: "")
    
    
    
    
    }
    
    
    
 }
