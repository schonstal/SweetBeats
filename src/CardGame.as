package
{
  import org.flixel.*;

  [SWF(width="640", height="480", backgroundColor="#000000")]
  [Frame(factoryClass="Preloader")]

  public class CardGame extends FlxGame
  {
    public function CardGame() {
      FlxG.debug = true;
      forceDebugger = true;

      super(320,240,PlayState,2);
    }
  }
}
