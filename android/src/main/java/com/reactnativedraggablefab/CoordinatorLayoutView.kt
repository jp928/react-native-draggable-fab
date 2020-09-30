package com.reactnativedraggablefab

import android.content.Context
import android.view.ViewGroup
import androidx.coordinatorlayout.widget.CoordinatorLayout


class CoordinatorLayoutView(context: Context?) : CoordinatorLayout(context!!) {
  private val measureAndLayout = Runnable {
    measure(
      MeasureSpec.makeMeasureSpec(width, MeasureSpec.EXACTLY),
      MeasureSpec.makeMeasureSpec(height, MeasureSpec.EXACTLY))
    layout(left, top, right, bottom)
  }

  override fun requestLayout() {
    super.requestLayout()
    post(measureAndLayout)
  }

  init {
    val width = ViewGroup.LayoutParams.MATCH_PARENT
    val height = ViewGroup.LayoutParams.MATCH_PARENT
    val params = LayoutParams(width, height)
    this.layoutParams = params
    this.fitsSystemWindows = false
  }
}
