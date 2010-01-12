package com.fnicollet.toaster.effect {
  import com.fnicollet.toaster.message.ToastMessageBase;

  import flash.geom.Point;

  import mx.effects.Effect;

  public interface IToasterEffectDescriptor {
    function getAddedEffect(toastMessage:ToastMessageBase):Effect;
    function getMoveToStackTopEffect(toastMessage:ToastMessageBase, moveFrom:Point, moveTo:Point):Effect;
    function getMoveToStackBottomEffect(toastMessage:ToastMessageBase, moveTo:Point):Effect;
    function getRemovedEffect(toastMessage:ToastMessageBase, moveTo:Point):Effect;
  }
}