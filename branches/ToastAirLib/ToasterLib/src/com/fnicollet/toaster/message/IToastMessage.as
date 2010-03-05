package com.fnicollet.toaster.message {
  import com.fnicollet.toaster.container.IToastContainer;


  public interface IToastMessage {
    function set container(value:IToastContainer):void;
    function get markedForDeletion():Boolean;
    function set markedForDeletion(value:Boolean):void;
    function get markedForAddition():Boolean;
    function set markedForAddition(value:Boolean):void;
  }
}