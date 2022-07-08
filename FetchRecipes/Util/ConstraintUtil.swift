//
//  ConstaintUtil.swift
//
//  Created by John Nimis on 11/9/20.
//

import UIKit

class ConstraintUtil: NSObject {

    class func placeView(_ v : UIView, inside superview : UIView, padding : CGFloat = 0.0) {
        superview.addSubview(v)
        centerView(v, inside: superview, padding: padding)
    }
    
    class func centerView(_ v : UIView, inside superview : UIView, padding : CGFloat = 0.0) {
        pinToTop(v, inView: superview, padding: padding)
        pinToBottom(v, inView: superview, padding: padding)
        pinToRight(v, inView: superview, padding: padding)
        pinToLeft(v, inView: superview, padding: padding)
    }
    
    class func pinToRight(_ view : UIView, inView : UIView, padding : CGFloat) {
        let c = constraintPinning(inView, toView: view, attribute: .trailing, padding: padding)
        inView.addConstraint(c)
    }

    class func pinToLeft(_ view : UIView, inView : UIView, padding : CGFloat) {
        let c = constraintPinning(view, toView: inView, attribute: .leading, padding: padding)
        inView.addConstraint(c)
    }

    class func pinToTop(_ view : UIView, inView : UIView, padding : CGFloat) {
        let c = constraintPinning(view, toView: inView, attribute: .top, padding: padding)
        inView.addConstraint(c)
    }

    class func pinToBottom(_ view : UIView, inView : UIView, padding : CGFloat) {
        let c = constraintPinning(view, toView: inView, attribute: .bottom, padding: padding)
        inView.addConstraint(c)
    }
    
    @objc class func constrainHeight(_ view : UIView, to value: CGFloat) {
        let c = NSLayoutConstraint.init(item: view,
                                        attribute: .height,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .height,
                                        multiplier: 1.0,
                                        constant: value)
        view.addConstraint(c)
    }
    
    class func constrainWidth(_ view : UIView, to value: CGFloat) {
        let c = NSLayoutConstraint.init(item: view,
                                        attribute: .width,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .width,
                                        multiplier: 1.0,
                                        constant: value)
        view.addConstraint(c)
    }
    
    class func centerX(_ view : UIView, inView : UIView, offset : CGFloat = 0.0) {
        let c = NSLayoutConstraint.init(item: view,
                                        attribute: .centerX,
                                        relatedBy: .equal,
                                        toItem: inView,
                                        attribute: .centerX,
                                        multiplier: 1.0,
                                        constant: offset)
        inView.addConstraint(c)
    }
    
    class func centerY(_ view : UIView, inView : UIView, offset : CGFloat = 0.0) {
        let c = NSLayoutConstraint.init(item: view,
                                        attribute: .centerY,
                                        relatedBy: .equal,
                                        toItem: inView,
                                        attribute: .centerY,
                                        multiplier: 1.0,
                                        constant: offset)
        inView.addConstraint(c)
    }
    
    class func pinBelow(_ view : UIView, toView : UIView, inView : UIView, padding : CGFloat) {
        let c = NSLayoutConstraint.init(item: view,
                                        attribute: .top,
                                        relatedBy: .equal,
                                        toItem: toView,
                                        attribute: .bottom,
                                        multiplier: 1.0,
                                        constant: padding)
        inView.addConstraint(c)
    }
    
    class func constraintPinning(_ view : UIView, toView : UIView, attribute : NSLayoutConstraint.Attribute, padding : CGFloat) -> NSLayoutConstraint {
        
        return NSLayoutConstraint.init(item: view,
                                       attribute: attribute,
                                       relatedBy: .equal,
                                       toItem: toView,
                                       attribute: attribute,
                                       multiplier: 1.0,
                                       constant: padding)
    }
    
    class func equalHeight(_ view : UIView, withView : UIView, inView : UIView) {
        let c = NSLayoutConstraint.init(item: view,
                                        attribute: .height,
                                        relatedBy: .equal,
                                        toItem: withView,
                                        attribute: .height,
                                        multiplier: 1.0,
                                        constant: 0.0)
        inView.addConstraint(c)
    }
    
    class func equalWidth(_ view : UIView, withView : UIView, inView : UIView) {
        let c = NSLayoutConstraint.init(item: view,
                                        attribute: .width,
                                        relatedBy: .equal,
                                        toItem: withView,
                                        attribute: .width,
                                        multiplier: 1.0,
                                        constant: 0.0)
        inView.addConstraint(c)
    }

}
