@objc(DraggableFab)
class DraggableFab: RCTViewManager {
    lazy var floaty = DraggableFabView()
    
    
    override func view() -> UIView! {
        floaty.isDraggable = true
        floaty.friendlyTap = true

        return floaty
    }
    
    override static func requiresMainQueueSetup() -> Bool {
        return true
    }
}
