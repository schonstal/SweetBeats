package
{
  import org.flixel.*;

  public class Hand extends FlxGroup
  {
    public static const MAX_SIZE = 6;

    private var cards:Array = [];

    public function get count():uint {
      return cards.length;
    }

    public function addCard(card:Card):void {
      add(card);
      cards.push(card);
    }

    public function contains(card:Card):Boolean {
      return cards.indexOf(card) >= 0;
    }
  }
}
