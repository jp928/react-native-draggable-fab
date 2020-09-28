//
//  FabViewController.swift
//  DraggableFabExample
//
//  Created by Jing tai Piao on 28/9/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import UIKit
import Floaty

@objc class FabViewController: UIViewController, FloatyDelegate {
  var floaty = Floaty()
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    layoutFAB()

    floaty.isDraggable = true
  }
  
  func layoutFAB() {
    let item = FloatyItem()
    item.hasShadow = false
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
    floaty.addItem("I got a handler", icon: UIImage(named: "icMap")) { item in
      let alert = UIAlertController(title: "Hey", message: "I'm hungry...", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Me too", style: .default, handler: nil))
      self.present(alert, animated: true, completion: nil)
    }
    floaty.addItem(item: item)
    floaty.paddingX = self.view.frame.width/2 - floaty.frame.width/2
    floaty.fabDelegate = self
    
    self.view.addSubview(floaty)
    
  }
}
