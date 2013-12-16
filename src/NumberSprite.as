package
{
  import org.flixel.*;

  public class NumberSprite extends FlxSprite {
    public function NumberSprite(n:uint=0) {
      loadGraphic(Assets.Numbers, true, false, 8, 9);
      frame = n;
    }
  }
}
