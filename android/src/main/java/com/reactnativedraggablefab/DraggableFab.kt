package com.reactnativedraggablefab

import android.annotation.SuppressLint
import android.content.Context
import android.util.Log
import android.view.Gravity
import android.view.MotionEvent
import android.view.View
import android.view.ViewGroup
import android.widget.LinearLayout
import androidx.coordinatorlayout.widget.CoordinatorLayout
import com.google.android.material.floatingactionbutton.FloatingActionButton
import kotlin.math.abs
import kotlin.math.max
import kotlin.math.min


class DraggableFab(context: Context): FloatingActionButton(context) {
  private val CLICK_DRAG_TOLERANCE = 10
  private var downRawX: Float = 0F
  private var downRawY: Float = 0F
  private var dx: Float = 0F
  private var dy: Float = 0F

  private val ON_TOUCH_LISTENER = View.OnTouchListener { v: View, event: MotionEvent ->
      when (event.action) {
        MotionEvent.ACTION_DOWN -> {
          downRawX = event.rawX
          downRawY = event.rawY

          dx = v.x
          dy = v.y
        }
        MotionEvent.ACTION_MOVE -> {
          val viewWidth = v.width.toFloat()
          val viewHeight = v.height.toFloat()

          val viewParent = v.parent as View
          val parentWidth = viewParent.width
          val parentHeight = viewParent.height

          var newX: Float = event.rawX + dx
          newX = max(
            0F,
            newX
          )
          newX = min(parentWidth - viewWidth, newX)

          var newY = event.rawY + dy
          newY = max(0F, newY)
          newY = min(parentHeight - viewHeight, newY)

          v.animate()
            .x(newX)
            .y(newY)
            .setDuration(0)
            .start()

        }
        MotionEvent.ACTION_UP -> {
          val upRawX = event.rawX
          val upRawY = event.rawY

          val upDX = upRawX - downRawX
          val upDY = upRawY - downRawY

          if (abs(upDX) < CLICK_DRAG_TOLERANCE && abs(upDY) < CLICK_DRAG_TOLERANCE) {
            v.performClick()
          }

//          return true
        }
        else -> {
          super.onTouchEvent(event)
        }
      }

    return@OnTouchListener super.onTouchEvent(event)
  }

//  lateinit var fab: ExpandableFab
//  lateinit var expandableFabLayout: ExpandableFabLayout

  init {
    val layoutParams = CoordinatorLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT)
    layoutParams.gravity = Gravity.BOTTOM or Gravity.RIGHT
    layoutParams.rightMargin = 140
    layoutParams.bottomMargin = 140
    this.setLayoutParams(layoutParams)
    this.setImageResource(R.drawable.ic_baseline_add_24)
//    this.exp
//    this.setOnTouchListener(ON_TOUCH_LISTENER)
  }

  public fun setIcon(uri: String) {
    this.setIcon(uri)
  }

}
