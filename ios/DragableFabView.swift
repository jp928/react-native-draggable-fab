//
//  DragableFabView.swift
//  react-native-draggable-fab
//
//  Created by Jing tai Piao on 30/9/20.
//

import Foundation
import Floaty

@objc(DraggableFabView)
class DraggableFabView: Floaty, FloatyDelegate {

    @objc var onOpen: RCTDirectEventBlock?
    
    override init() {
        super.init()
        fabDelegate = self
//
//        self.isDraggable = true
//        self.friendlyTap = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        fabDelegate = self
//        
//        self.isDraggable = true
//        self.friendlyTap = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        self.frame = self.bounds
//    }
    
    func floatyWillOpen(_ floaty: Floaty) {
        onOpen!([:])
    }
    
    @objc(setAnimateType:)
    public func setAnimateType(type: String) {
        self.openAnimationType = self.getAnimateType(type: type)
    }

    @objc(setItemLabels:)
    public func setItemLabels(itemLabels: [String]) {
        for label in itemLabels {
            let item = FloatyItem()
            item.hasShadow = true
            item.title = label
            item.titleLabelPosition = .left

            self.addItem(item: item)
        }
    }

    @objc(setOnItemTap:)
    public func setOnItemTap(onItemTap: RCTDirectEventBlock?) {
        for (index, item) in self.items.enumerated() {
            item.handler = {
                item in
                if (onItemTap != nil) {
                    onItemTap!(["index": index])
                }
            }
        }
    }

    @objc(setBackgroundColors:)
    public func setBackgroundColors(colors: [String]) {
        for (index, color) in colors.enumerated() {
            self.items[index].backgroundColor = UIColor(hex: color)
        }
    }

    @objc(setItemIcons:)
    public func setItemIcons(icons: [String]) {
        for (index, icon) in icons.enumerated() {
            let url = URL.init(fileURLWithPath: icon)
            let imageData:NSData = NSData(contentsOf: url)!
            let image = UIImage(data: imageData as Data)
            self.items[index].icon = image
        }
    }

    @objc(setFabColor:)
    public func setFabColor(color: String) {
        self.buttonColor = UIColor(hex: color) ?? UIColor.red
    }

    private func getAnimateType(type: String?) -> FloatyOpenAnimationType {
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

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(1)
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
