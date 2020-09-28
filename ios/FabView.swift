//
//  FabView.swift
//  DraggableFab
//
//  Created by Jing tai Piao on 28/9/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import UIKit
import Floaty

class FabView: FloatyDelegate {
    var floaty = Floaty()
    
    public func getFab() -> UIView {
        layoutFAB();
        
        return floaty;
    }
  
    @objc(setAnimateType:)
    public func setAnimateType(animateType: String) {
        print("=====>>>>")
        floaty.openAnimationType = getAnimateType(type: animateType)
    }
    
    
    func layoutFAB() {
        let item = FloatyItem()
        item.hasShadow = true
        item.buttonColor = UIColor.blue
        item.circleShadowColor = UIColor.red
        item.titleShadowColor = UIColor.blue
        item.titleLabelPosition = .right
        item.title = "titlePosition right"
        item.handler = { item in
            
        }
        
        floaty.hasShadow = false
        floaty.addItem(title: "I got a title")
        floaty.addItem("I got a icon", icon: UIImage(named: "icShare"))
        
        floaty.addItem(item: item)
        
        //        floaty.openAnimationType = .slideLeft
        
    }
    
    private func getAnimateType(type: String) -> FloatyOpenAnimationType {
        print("type is " + type)
        switch type {
        case "pop":
            return .pop
        case "fade":
            return .fade
        case "slideLeft":
            return .slideLeft
        case "slideUp":
            return .slideUp
        case "slideDown":
            return .slideDown
        default:
            return .none
        }
    }
}
