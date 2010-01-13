package com.fnicollet.toaster.message {
  import com.fnicollet.toaster.container.IToastContainer;
  import com.fnicollet.toaster.container.ToastContainerBase;
  
  import flash.events.Event;
  import flash.events.MouseEvent;
  
  import mx.containers.Box;
  
  public class ToastMessageBase extends Box implements IToastMessage {
    // container
    private var _container:IToastContainer = null;
    
    public function set container(value:IToastContainer):void {
      if (_container != value) {
        _container = value;
        _container.addEventListener(ToastContainerBase.LIFE_TICK, lifeTick, false, 0, true);
        if (_container.lockOnRollOver) {
          addEventListener(MouseEvent.ROLL_OUT, onRollOut);
          addEventListener(MouseEvent.ROLL_OVER, onRollOver);
        }
      }
    }
    /**
     *
     */
    private var _markedForDeletion:Boolean = false;
    
    public function get markedForDeletion():Boolean {
      return _markedForDeletion;
    }
    
    public function set markedForDeletion(value:Boolean):void {
      _markedForDeletion = value;
    }
    /**
     *
     */
    private var _markedForAddition:Boolean = false;
    
    public function get markedForAddition():Boolean {
      return _markedForAddition;
    }
    
    public function set markedForAddition(value:Boolean):void {
      _markedForAddition = value;
    }
    /**
     * time before the message disappears
     */
    private var _timeToLive:uint = 8;
    
    public function get timeToLive():uint {
      return _timeToLive;
    }
    
    public function set timeToLive(value:uint):void {
      _timeToLive = value;
    }
    /**
     * Acts like an infinite Timer
     */
    private var _infiniteLife:Boolean = false;
    
    public function get infiniteLife():Boolean {
      return _infiniteLife;
    }
    
    public function set infiniteLife(value:Boolean):void {
      _infiniteLife = value;
    }
    
    ////////////////////////////////////////////////////////
    // CONSTRUCTOR
    public function ToastMessageBase() {
      super();
      setStyle("horizontalScrollPolicy", "off");
      setStyle(verticalScrollPolicy, "off");
    }
    
    // called every second that the container is considered active
    public function lifeTick(event:Event):void {
      if (_infiniteLife) {
        // don't count the time left to live, it's infinite
        return;
      }
      _timeToLive--;
      if (_timeToLive < 1) {
        close();
      }
    }
    
    private function onRollOut(event:Event):void {
      if (_container) {
        _container.resumeExpiration();
      }
    }
    
    private function onRollOver(event:Event):void {
      if (_container) {
        _container.pauseExpiration();
      }
    }
    
    public function close():void {
      if (_container.lockOnRollOver) {
        removeEventListener(MouseEvent.ROLL_OUT, onRollOut);
        removeEventListener(MouseEvent.ROLL_OVER, onRollOver);
      }
      _container.removeEventListener(ToastContainerBase.LIFE_TICK, lifeTick);
      _container.closeToastMessage(this);
    }
  
  }
}

