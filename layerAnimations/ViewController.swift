//
//  ViewController.swift
//  layerAnimations
//
//  Created by cocoabanana on 16/7/13.
//  Copyright © 2016年 cocoabanana. All rights reserved.
//

import UIKit

let backGroundViewHeight:CGFloat = 200.0
let strokePathWidth:CGFloat = 20.0
let firstBackGroundViewFrame = CGRect(x: 0, y: 20, width: UIScreen.mainScreen().bounds.width, height: backGroundViewHeight)

let percentStr = "79%"

class ViewController: UIViewController {

    let androidPercent:CGFloat = 0.71
    let iosPercent:CGFloat = 0.29
    let BezierPathFrame:CGRect = CGRect(x: (firstBackGroundViewFrame.size.width - (backGroundViewHeight-2 * strokePathWidth))/2.0 , y:strokePathWidth , width: backGroundViewHeight - 2 * strokePathWidth, height: backGroundViewHeight - 2 * strokePathWidth)
    
    var firstBackGroundView : UIView = {
        let tempView = UIView(frame: firstBackGroundViewFrame)
        tempView.backgroundColor = UIColor.lightGrayColor()
        return tempView
        
    }()
    
    let textAttributes:[NSObject:AnyObject] = {
       let style = NSMutableParagraphStyle()
        style.alignment = .Center
        
        return [NSFontAttributeName:UIFont(name: "HelveticaNeue-Thin",
            size: 28.0)!,NSParagraphStyleAttributeName:style,NSForegroundColorAttributeName:UIColor.redColor()]
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(firstBackGroundView)
        
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.whiteColor().CGColor
        shapeLayer.strokeColor = UIColor.yellowColor().CGColor
        shapeLayer.lineWidth = 20
        shapeLayer.path = UIBezierPath(ovalInRect:BezierPathFrame).CGPath
        shapeLayer.strokeStart = iosPercent
        shapeLayer.strokeEnd = 1.0

        firstBackGroundView.layer.addSublayer(shapeLayer)
        
        let shapeLayer2:CAShapeLayer = CAShapeLayer()
        shapeLayer2.fillColor = UIColor.clearColor().CGColor
        shapeLayer2.lineWidth = 20
        shapeLayer2.path = UIBezierPath(ovalInRect:BezierPathFrame).CGPath
        shapeLayer2.strokeColor = UIColor.redColor().CGColor
        shapeLayer2.strokeEnd = iosPercent
        shapeLayer2.strokeStart = 0
        firstBackGroundView.layer.addSublayer(shapeLayer2)
        
        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.duration = 1.0
        animation.fromValue = 1.0
        animation.toValue = iosPercent
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        shapeLayer.addAnimation(animation, forKey: nil)
        
        
        let animation1 = CABasicAnimation(keyPath: "strokeEnd")
        animation1.duration = 1.0
        animation1.fromValue = 0
        animation1.toValue = iosPercent
        animation1.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        shapeLayer2.addAnimation(animation1, forKey: nil)
        
        let animation2 = CABasicAnimation(keyPath: "fillColor")
        animation2.duration = 1.0
        animation2.fromValue = UIColor.clearColor().CGColor
        animation2.toValue = UIColor.whiteColor().CGColor
        animation2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        shapeLayer.addAnimation(animation2, forKey: nil)

        
        
//        let layerLabel:CALayer = CALayer()
//        //Bezier画圈：外环中心线贴着矩形边。
//        layerLabel.frame = CGRect(x: BezierPathFrame.origin.x - 10, y: BezierPathFrame.origin.y - 10, width: BezierPathFrame.size.width + 20, height: BezierPathFrame.size.height + 20)
//        
//        
//        layerLabel.backgroundColor = UIColor.blueColor().CGColor
//        
//        UIGraphicsBeginImageContextWithOptions(CGSizeMake(BezierPathFrame.size.width + 20, BezierPathFrame.size.height + 20), false, 0)
//        percentStr.drawInRect(CGRectMake(0, 0, BezierPathFrame.size.width + 20, BezierPathFrame.size.height + 20), withAttributes: textAttributes as? [String:AnyObject])
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        layerLabel.contents = image.CGImage
//        
//        shapeLayer.mask = layerLabel

        
//        let shapeLayer3:CAShapeLayer = CAShapeLayer()
//        shapeLayer3.fillColor = UIColor.whiteColor().CGColor
//        shapeLayer3.lineWidth = 0
//        let frame3:CGRect = CGRect(x: (firstBackGroundViewFrame.size.width - 40)/2.0 , y:(firstBackGroundViewFrame.size.height - 40)/2.0 , width: 40, height: 40)
//        shapeLayer3.path = UIBezierPath(ovalInRect: frame3).CGPath
//        shapeLayer3.strokeColor = UIColor.redColor().CGColor
//        shapeLayer3.strokeEnd = 1.0
//        shapeLayer3.strokeStart = 0.0
//        firstBackGroundView.layer.addSublayer(shapeLayer3)
//        
//        
//        UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 200), false, 0)
//        percentStr.drawInRect(CGRectMake(0, 0, 200, 200), withAttributes: textAttributes as? [String:AnyObject])
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        shapeLayer3.contents = image.CGImage
        
        let frame3:CGRect = CGRect(x: (firstBackGroundViewFrame.size.width - 40)/2.0 , y:(firstBackGroundViewFrame.size.height - 40)/2.0 , width: 40, height: 40)
        let subTitleLabel = UILabel(frame: frame3)
        subTitleLabel.textAlignment = .Center
        subTitleLabel.text = percentStr
        subTitleLabel.textColor = UIColor.greenColor()
        subTitleLabel.alpha = 0
        firstBackGroundView.addSubview(subTitleLabel)
        UIView.animateWithDuration(2.0) { 
            subTitleLabel.alpha = 1.0
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

