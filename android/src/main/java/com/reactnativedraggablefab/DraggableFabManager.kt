package com.reactnativedraggablefab

import android.view.View
import androidx.coordinatorlayout.widget.CoordinatorLayout
import com.facebook.react.bridge.ReactContext
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp
import com.facebook.react.uimanager.events.RCTEventEmitter
import com.google.android.material.floatingactionbutton.FloatingActionButton
import com.google.android.material.floatingactionbutton.FloatingActionButton.SIZE_NORMAL
import com.facebook.react.bridge.Arguments;

class DraggableFabManager : SimpleViewManager<DraggableFab>() {

  private lateinit var container: CoordinatorLayout
  private lateinit var fab: FloatingActionButton

  private val ON_CLICK_LISTENER = View.OnClickListener {
    // Do whatever this button will do on click event
//    Log.d("Fab", "HELLO WORLD")
    val event = Arguments.createMap()
   (it.context as ReactContext).getJSModule(RCTEventEmitter::class.java).receiveEvent(it.getId(), "topChange", event)
  }

  override fun getName(): String {
    return "DraggableFab"
  }

  override fun createViewInstance(reactContext: ThemedReactContext): DraggableFab {
    val fab = DraggableFab(reactContext)
    fab.size = SIZE_NORMAL
    fab.setOnClickListener(ON_CLICK_LISTENER)
    return fab
  }

//  @ReactProp(name = "icon")
//  fun setIcon(view: DraggableFab, uri: String?) {
//    if (uri != null) {
//      view.setIcon(uri)
//    }
//  }
}
