package com.fnicollet.toaster {
  import com.fnicollet.toaster.container.ToastContainerBase;
  import com.fnicollet.toaster.message.IToastMessage;
  import com.fnicollet.toaster.message.ToastMessageBase;

  import flash.events.Event;
  import flash.geom.Point;
  import flash.geom.Rectangle;

  import mx.containers.Canvas;
  import mx.core.UIComponent;
  import mx.events.FlexEvent;

  public class Toaster extends Canvas {
    //STATIC
    // STATIC PRIVATE
    private static var instance:Toaster = null;
    // STATIC PUBLIC
    // Overrides position for any call
    public static var globalPosition:String = null;

    private var _toastContainerParent:UIComponent = null;

    public function get toastContainerParent():UIComponent {
      return _toastContainerParent;
    }

    public function set toastContainerParent(value:UIComponent):void {
      _toastContainerParent = value;
    }

    // PRIVATE
    private var _containers:Array = [];

    public function get containers():Array {
      return _containers;
    }

    public function set containers(value:Array):void {
      _containers = value;
    }

    // CONSTRUCTOR
    public function Toaster() {
      super();
      setStyle("horizontalScrollPolicy", "off");
      setStyle("verticalScrollPolicy", "off");
      instance = this;
    }

    public static function getInstance():Toaster {
      return instance;
    }

    // PUBLIC STATIC METHODS
    public static function toast(message:IToastMessage, position:String = ToasterPosition.BOTTOM_RIGHT):void {
      if (globalPosition) {
        position = globalPosition;
      }
      var isKnownPosition:Boolean = ToasterPosition.isKnownPosition(position);
      if (!isKnownPosition) {
        trace("Position Unknown")
        return;
      }
      var container:ToastContainerBase = instance.getToastContainerByPosition(position);
      if (!container) {
        // container wasn't defined in MXML, we create a basic one
        container = new ToastContainerBase;
        container.position = position;
        instance._containers.push(container);
      }
      var instanceChildren:Array = instance.getChildren();
      if (instanceChildren.indexOf(container) == -1) {
        // set the global property on the children
        if (instance._toastContainerParent) {
          container.toastContainerParent = instance._toastContainerParent;
        }
        instance.addChild(container);
      }
      container.addToastMessage(message as ToastMessageBase);
    }

    // PUBLIC METHODS
    public function toast(message:IToastMessage, position:String = ToasterPosition.BOTTOM_RIGHT):void {
      var isKnownPosition:Boolean = ToasterPosition.isKnownPosition(position);
      if (!isKnownPosition) {
        trace("Position Unknown")
        return;
      }
      var container:ToastContainerBase = getToastContainerByPosition(position);
      if (!container) {
        // container wasn't defined in MXML, we create a basic one
        container = new ToastContainerBase;
        container.position = position;
        _containers.push(container);
      }
      var instanceChildren:Array = getChildren();
      if (instanceChildren.indexOf(container) == -1) {
        // set the global property on the children
        if (_toastContainerParent) {
          container.toastContainerParent = _toastContainerParent;
        }
        addChild(container);
      }
      container.addToastMessage(message as ToastMessageBase);
    }

    // Returns a container depending on the position given
    // returns either a container defined in MXML or dynamically created if not defined in MXML
    private function getToastContainerByPosition(position:String):ToastContainerBase {
      var container:ToastContainerBase = null;
      for each (var containerBase:ToastContainerBase in _containers) {
        if (containerBase.position == position) {
          return containerBase;
        }
      }
      //trace("Impossible de déterminer le conteneur à la position: " + position);
      return container;
    }

  }
}
