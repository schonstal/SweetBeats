package
{
  import org.flixel.*;
  import com.greensock.*;
  import com.greensock.easing.*;

  public class LightMask extends FlxSprite
  {
    public static const ALPHA:Number = 0.4;

    private var brush:FlxSprite;
    private var mask:FlxSprite;

    public function LightMask() {
      brush = new FlxSprite();
      brush.makeGraphic(FlxG.width, FlxG.height, 0xff000000);
      makeGraphic(FlxG.width, FlxG.height, 0xff000000, true);
      blend = "hardlight";
      alpha = 0;
    }

    public function fadeIn():void {
      TweenLite.to(this, 0.3, {
        alpha: ALPHA, 
        ease: Quart.easeOut
      });
    }

    public function fadeOut():void {
      TweenLite.to(this, 0.3, {
        alpha: 0, 
        ease: Quart.easeOut
      });
    }

    public override function update():void {
      stamp(brush);
      super.update();
    }

  }
}
