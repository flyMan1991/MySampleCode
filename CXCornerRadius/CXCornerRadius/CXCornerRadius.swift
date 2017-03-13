//
//  CXCornerRadius.swift
//  CXCornerRadius
//
//  Created by mac on 2017/3/13.
//  Copyright © 2017年 CES. All rights reserved.
//

import Foundation
import UIKit


// MARK: -    私有方法
private func roundByUnit(num: Double, unit: inout Double) ->Double {
    let remain = modf(num, &unit)
    if remain > unit/2.0 {
        return ceilbyunit(num: num, unit: &unit)
    }else{
        return floorbyunit(num: num, unit: &unit)
    }
}

private func ceilbyunit (num: Double ,unit :inout Double) -> Double {
    return num - modf(num, &unit) + unit
}

private func floorbyunit (num:Double, unit: inout Double) ->Double {
    return num - modf(num, &unit)
}

private func pixel(num:Double)->Double {
    var unit:Double
    switch Int(UIScreen.main.scale) {
    case 1: unit = 1.0 / 1.0
    case 2: unit = 1.0 / 2.0
    case 3: unit = 1.0 / 3.0
    default: unit = 0.0
    }
    return roundByUnit(num: num, unit: &unit)
}




// MARK: - ****   延展
extension UIView {
    func cx_addCorner(radius: CGFloat)  {
        self.cx_addCorner(radius: radius, borderWidth: 1, backgroundColor: UIColor.clear, borderColor: UIColor.black)
    }
    
    func cx_addCorner(radius:CGFloat,
                       borderWidth:CGFloat,
                backgroundColor:UIColor,
                        borderColor:UIColor)  {
        let imageview = UIImageView.init(image:self.kt_drawRectWithRoundedCorner(radius: radius, borderWidth: borderWidth, backgroundColor: backgroundColor, borderColor: borderColor) )
        self.insertSubview(imageview, at: 0)
        
    }
    
    
    func kt_drawRectWithRoundedCorner(radius: CGFloat,
                                      borderWidth: CGFloat,
                                      backgroundColor: UIColor,
                                      borderColor: UIColor) -> UIImage {
        let sizeToFit = CGSize(width: pixel(num: Double(self.bounds.size.width)), height: Double(self.bounds.size.height))
        let halfBorderWidth = CGFloat(borderWidth / 2.0)
        
        UIGraphicsBeginImageContextWithOptions(sizeToFit, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        
        context!.setLineWidth(borderWidth)
        context!.setStrokeColor(borderColor.cgColor)
        context!.setFillColor(backgroundColor.cgColor)
        
        let width = sizeToFit.width, height = sizeToFit.height
        context?.move(to: CGPoint.init(x: width - halfBorderWidth, y: radius + halfBorderWidth)) // 开始坐标右边开始
        context?.addArc(tangent1End: CGPoint.init(x: width - halfBorderWidth, y: height - halfBorderWidth), tangent2End: CGPoint.init(x: width - radius - halfBorderWidth, y: height - halfBorderWidth), radius: radius); // 右下角角度
        context?.addArc(tangent1End: CGPoint.init(x: halfBorderWidth, y: height - halfBorderWidth), tangent2End: CGPoint.init(x: halfBorderWidth, y: height - radius - halfBorderWidth), radius: radius); // 左下角角度
        
         context?.addArc(tangent1End: CGPoint.init(x: halfBorderWidth, y: halfBorderWidth), tangent2End: CGPoint.init(x: width - halfBorderWidth, y: halfBorderWidth), radius: radius); // 左上角角度
        
        
        
         context?.addArc(tangent1End: CGPoint.init(x: width - halfBorderWidth, y: halfBorderWidth), tangent2End: CGPoint.init(x: width - halfBorderWidth, y: radius + halfBorderWidth), radius: radius); // 右上角角度
        
        UIGraphicsGetCurrentContext()!.drawPath(using: .fillStroke)
        let output = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return output!
    }
    
    

    
}



extension UIImage {
    func kt_drawRectWithRoundedCorner(radius: CGFloat, _ sizetoFit: CGSize) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: sizetoFit)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.addPath(UIBezierPath.init(roundedRect: rect, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize.init(width: radius, height: radius)) as! CGPath)
        context?.clip()
        
        self.draw(in: rect)
        context?.drawPath(using: .fillStroke)
        let output = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return output!
    }
    
    func imageAddCornerWithRadius(radius:CGFloat,size:CGSize) -> UIImage {
        let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let ctx = UIGraphicsGetCurrentContext()
        let path = UIBezierPath.init(roundedRect: rect, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize.init(width: radius, height: radius))
        ctx?.addPath(path.cgPath)
        ctx?.clip()
        self.draw(in: rect)
        ctx?.drawPath(using: .fillStroke)
        let newimage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newimage!
    }
    
}








