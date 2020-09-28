import Floaty

@objc(DraggableFab)
class DraggableFab: RCTViewManager, FloatyDelegate {
    var floaty = Floaty()
    
    override func view() -> UIView! {
        layoutFAB()
        floaty.isDraggable = true
        // super.init(frame: frame)
        // self.addSubview(UIView())
        return floaty
    }

    // var parentViewController: UIViewController? {
    //     var parentResponder: UIResponder? = self
    //     while parentResponder != nil {
    //         parentResponder = parentResponder!.next
    //         if let viewController = parentResponder as? UIViewController {
    //             return viewController
    //         }
    //     }
    //     return nil
    // }
    
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
//        floaty.addItem("I got a handler", icon: UIImage(named: "icMap")) { item in
//            let alert = UIAlertController(title: "Hey", message: "I'm hungry...", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Me too", style: .default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }
        floaty.addItem(item: item)
//        floaty.paddingX = self.view.frame.width/2 - floaty.frame.width/2
        // floaty.fabDelegate = self
    }
}
