package
{
  import org.flixel.*;

  public class IconSprite extends FlxSprite {
    public function IconSprite() {
      loadGraphic(Assets.Icons, true, false, 16, 16);
    }

    public function setIcon(stat:String, value:Number):IconSprite {
      frame = (Card.TYPES.indexOf(stat) * 3) + value - 1;
      return this;
    }
  }
}
