package com.fnicollet.toaster.container {
  import com.fnicollet.toaster.message.ToastMessageBase;

  import flash.events.Event;
  import flash.events.IEventDispatcher;

  public interface IToastContainer extends IEventDispatcher {
    function addToastMessage(toastMessage:ToastMessageBase):void;
    function closeToastMessage(toastMessage:ToastMessageBase):void;
    function pauseExpiration(event:Event = null):void;
    function resumeExpiration(event:Event = null):void;
    function set position(position:String):void;
    function get position():String;
    function get lockOnRollOver():Boolean;
  }
}