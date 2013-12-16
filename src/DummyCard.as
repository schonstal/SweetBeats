package
{
  import org.flixel.*;

  public class DummyCard extends FlxSprite
  {
    public function DummyCard() {
      loadGraphic(Assets.Deck, true, false, 23, 33, true);
      initialize();
    }

    public function initialize():void {
      x = 9;
      y = 128;
    }
  }
}
