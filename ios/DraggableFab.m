#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>
#import <React/UIView+React.h>

@interface RCT_EXTERN_MODULE(DraggableFab, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(animateType, NSString)
RCT_EXPORT_VIEW_PROPERTY(itemLabels, NSArray)
RCT_EXPORT_VIEW_PROPERTY(backgroundColors, NSArray)
RCT_EXPORT_VIEW_PROPERTY(onItemTap, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onOpen, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(fabColor, NSString)

@end
