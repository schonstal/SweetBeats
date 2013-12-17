package
{
  import org.flixel.*;

  public class LightMask extends FlxSprite
  {
    private var brush:FlxSprite;
    private var mask:FlxSprite;

    public function LightMask() {
      brush = new FlxSprite();
      brush.makeGraphic(FlxG.width, FlxG.height, 0xff000000);
      makeGraphic(FlxG.width, FlxG.height, 0xff000000, true);
      blend = "hardlight";
      alpha = 0.4;
    }

    public override function update():void {
      stamp(brush);
      super.update();
    }

  }
}
