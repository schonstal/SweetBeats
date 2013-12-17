package
{
  import org.flixel.*;

  public class Overlay extends FlxSprite
  {
    private var brush:FlxSprite;
    private var mask:FlxSprite;

    public function Overlay() {
      makeGraphic(FlxG.width, FlxG.height, 0x00000000, true);
    }

    public override function preUpdate():void {
      fill(0x00000000);
      super.preUpdate();
    }
  }
}
