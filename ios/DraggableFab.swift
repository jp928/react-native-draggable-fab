import Floaty

@objc(DraggableFab)
class DraggableFab: RCTViewManager, FloatyDelegate {
    var floaty = Floaty()
    
    
    override func view() -> UIView! {
        floaty.isDraggable = true
        floaty.friendlyTap = true
        return floaty
    }

    override static func requiresMainQueueSetup() -> Bool {
        return true
    }
}

extension Floaty {    
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
            item.titleLabelPosition = .right
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

