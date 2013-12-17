package
{
  import org.flixel.*;
  import com.greensock.*;
  import com.greensock.easing.*;

  public class HealthSprite extends FlxSprite {
    public function HealthSprite(value:uint=0) {
      loadGraphic(Assets.Heart, true, false, 11, 11);
      addAnimation('appear', [0,1,2,3], 15, false);
      addAnimation('die', [4], 0, false);
      visible = false;

      x = 44 + width*value;
      y = 151;
    }

    public function forceVisibility():void {
      frame = 3;
      visible = true;
    }

    public function appear():void {
      if(!visible) {
        visible = true;
        play('appear');
      }
    }
  }
}
