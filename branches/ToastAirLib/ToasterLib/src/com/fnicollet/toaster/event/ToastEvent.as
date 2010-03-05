package com.fnicollet.toaster.event {
  import flash.events.Event;

  public class ToastEvent extends Event {
    public static const ON_TOAST_ADDED:String = "onToastAdded";
    public static const ON_TOAST_REMOVED:String = "onToastRemoved";

    public function ToastEvent(type:String) {
      super(type);
    }

  }
}

