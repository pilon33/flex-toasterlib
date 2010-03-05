package com.fnicollet.toaster.effect {
  import com.fnicollet.toaster.message.ToastMessageBase;
  
  import flash.geom.Point;
  
  import mx.effects.Blur;
  import mx.effects.Effect;
  import mx.effects.Fade;
  import mx.effects.Move;
  import mx.effects.Parallel;
  
  public class ToasterEffectDescriptorBase implements IToasterEffectDescriptor {
    private var _moveDuration:int = 500;
    private var _blurDuration:int = 500;
    private var _fadeDuration:int = 500;
    
    public function ToasterEffectDescriptorBase() {
    }
    
    public function getAddedEffect(toastMessage:ToastMessageBase):Effect {
      var fadeIn:Fade = new Fade(toastMessage);
      fadeIn.alphaFrom = 0;
      fadeIn.alphaTo = 1;
      fadeIn.duration = _fadeDuration;
      return fadeIn;
    }
    
    public function getMoveToStackTopEffect(toastMessage:ToastMessageBase, moveFrom:Point, moveTo:Point):Effect {
      var move:Move = new Move(toastMessage);
      move.xFrom = moveFrom.x;
      move.yFrom = moveFrom.y;
      move.xTo = moveTo.x;
      move.yTo = moveTo.y;
      move.duration = _moveDuration;
      return move;
    }
    
    public function getMoveToStackBottomEffect(toastMessage:ToastMessageBase, moveTo:Point):Effect {
      var move:Move = new Move(toastMessage);
      move.yTo = moveTo.y < 0 ? 0 : moveTo.y;
      move.duration = _moveDuration;
      return move;
    }
    
    public function getRemovedEffect(toastMessage:ToastMessageBase, moveTo:Point):Effect {
      
      var parallel:Parallel = new Parallel(toastMessage);
      var move:Move = new Move(toastMessage);
      move.xTo = moveTo.x;
      move.yTo = moveTo.y;
      move.duration = _moveDuration;
      parallel.addChild(move);
      var blur:Blur = new Blur(toastMessage);
      blur.blurXFrom = 0;
      blur.blurYFrom = 0;
      blur.blurXTo = 10;
      blur.blurYTo = 10;
      blur.duration = _blurDuration;
      parallel.addChild(blur);
      
      parallel.end();
      return parallel;
    }
  
  }
}