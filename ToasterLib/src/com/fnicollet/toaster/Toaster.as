package com.fnicollet.toaster {
  import com.fnicollet.toaster.container.ToastContainerBase;
  import com.fnicollet.toaster.message.IToastMessage;
  import com.fnicollet.toaster.message.ToastMessageBase;
  
  import flash.events.Event;
  import flash.geom.Point;
  import flash.geom.Rectangle;
  
  import mx.containers.Canvas;
  import mx.core.IVisualElement;
  import mx.core.UIComponent;
  import mx.events.FlexEvent;
  
  import spark.components.SkinnableContainer;

  /**
   * Main class that will contain multiple containers (one for each corner)
   */
  public class Toaster extends SkinnableContainer {
    //STATIC
    // STATIC PRIVATE
    private static var instance:Toaster = null;
    // STATIC PUBLIC
    /**
     *  Overrides position for any call
     */
    public static var globalPosition:String = null;
    private var _toastContainerParent:UIComponent = null;

    /**
     * Specifies a custom parent for the toasts (not the Application)
     */

    public function get toastContainerParent():UIComponent {
      return _toastContainerParent;
    }

    public function set toastContainerParent(value:UIComponent):void {
      _toastContainerParent = value;
    }
    private var _useLocalPosition:Boolean = false;

    /**
     * Tells the container wether to use a global positionning or a local one
     */

    public function get useLocalPosition():Boolean {
      return _useLocalPosition;
    }

    public function set useLocalPosition(value:Boolean):void {
      _useLocalPosition = value;
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
      if (!instance) {
        trace("Toaster.as::toast:Can't find a Toaster, the Toaster component ain't instanciated");
        return;
      }
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
        container.useLocalPosition = instance.useLocalPosition;
        instance._containers.push(container);
      }
      var elementFound:Boolean = false;
      var nbElements:int =  instance.numElements;
      for (var i:int = 0; i < nbElements ; i++){
        var currentElement:IVisualElement =  instance.getElementAt(i);
        if (currentElement == container){
          elementFound = true;
          break;
        }
      }
      if (!elementFound){
        if ( instance._toastContainerParent) {
          container.toastContainerParent =  instance._toastContainerParent;
        }
        instance.addElement(container);
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
        container.useLocalPosition = useLocalPosition;
        _containers.push(container);
      }
      var elementFound:Boolean = false;
      var nbElements:int = numElements;
      for (var i:int = 0; i < nbElements ; i++){
        var currentElement:IVisualElement = getElementAt(i);
        if (currentElement == container){
          elementFound = true;
          break;
        }
      }
      if (!elementFound){
        if (_toastContainerParent) {
          container.toastContainerParent = _toastContainerParent;
        }
        addElement(container);
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
