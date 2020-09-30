package com.reactnativedraggablefab


import android.view.View
import androidx.coordinatorlayout.widget.CoordinatorLayout
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewGroupManager
import com.google.android.material.floatingactionbutton.FloatingActionButton


class CoordinatorLayoutManager : ViewGroupManager<CoordinatorLayoutView>() {
  private lateinit var container: CoordinatorLayoutView

  override fun getName(): String {
    return "CoordinatorLayout"
  }

  public override fun createViewInstance(context: ThemedReactContext): CoordinatorLayoutView {
    container = CoordinatorLayoutView(context)

    return container
  }

  /**
   * Find and sets the FloatingActionButton anchor automatically
   * @param parent CoordinatorLayout parent view
   * @param child Child view from addView
   */
//  private fun setFabAnchor(parent: CoordinatorLayout, child: View) {
//    if (child isFloatingActionButtonView) {
//      val fab: FloatingActionButtonView = child as FloatingActionButtonView
//      if (fab.getAutoAnchor()) {
//        for (i in 0 until parent.childCount) {
//          val childView = parent.getChildAt(i)
//          if (childView is BottomSheetBehaviorView) {
//            val bottomSheetId = childView.id
//            fab.setAnchor(bottomSheetId)
//            if ((childView as BottomSheetBehaviorView).behavior.getAnchorEnabled()) {
//              fab.setScrollBehavior()
//            }
//            fab.setAnchor(bottomSheetId)
//          }
//        }
//      }
//      // Set fab on the header view
//      if (headerView != null) {
//        headerView.setFabView(fab)
//      }
//    }
//  }
//
//  override fun addView(parent: CoordinatorLayoutView, child: View, index: Int) {
//    super.addView(parent, child, index)
//    setBottomSheetHeader(child)
//    setFabAnchor(parent, child)
//  }

  override fun needsCustomLayoutForChildren(): Boolean {
    return true
  }

  override fun addView(parent: CoordinatorLayoutView?, child: View?, index: Int) {
    if (child is FloatingActionButton) {
      container.addView(child)
    } else {
      super.addView(parent, child, index)
    }

  }
}
