package com.fnicollet.toaster {

  /**
   * Constants to specify the different position you can toast to
   */
  public class ToasterPosition {
    // center
    public static const CENTER_LEFT:String = "CL";
    public static const CENTER:String = "CENTER";
    public static const CENTER_RIGHT:String = "CR";
    // top
    public static const TOP_LEFT:String = "TL";
    public static const TOP_CENTER:String = "TC";
    public static const TOP_RIGHT:String = "TR";
    // bottom
    public static const BOTTOM_LEFT:String = "BL";
    public static const BOTTOM_CENTER:String = "BC";
    public static const BOTTOM_RIGHT:String = "BR";


    public static function isKnownPosition(position:String):Boolean {
      var isKnown:Boolean = false;
      switch (position) {
        case BOTTOM_CENTER:
        case BOTTOM_LEFT:
        case BOTTOM_RIGHT:
        case CENTER:
        case CENTER_LEFT:
        case CENTER_RIGHT:
        case TOP_CENTER:
        case TOP_LEFT:
        case TOP_RIGHT:
          return true;
          break;
      }
      return isKnown;
    }
  }
}