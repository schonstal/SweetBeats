package
{
  import org.flixel.*;

  [SWF(width="1280", height="960", backgroundColor="#000000")]
  [Frame(factoryClass="Preloader")]

  public class CardGame extends FlxGame
  {
    public function CardGame() {
      FlxG.debug = true;
      FlxG.visualDebug = true;
      forceDebugger = true;

      super(320,240,PlayState,4,60,60);
    }
  }
}
