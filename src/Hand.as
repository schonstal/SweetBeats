package
{
  import org.flixel.*;
  import com.greensock.*;
  import com.greensock.easing.*;

  public class Hand extends FlxGroup
  {
    public static const MAX_SIZE = 6;

    private var _cards:Array = [];

    public function get count():uint {
      return _cards.length;
    }

    public function addCard(card:Card):void {
      add(card);
      _cards.push(card);
    }

    public function contains(card:Card):Boolean {
      return _cards.indexOf(card) >= 0;
    }

    public function get cards():Array {
      return _cards;
    }

    public function removeCard(card:Card):void {
      var i:int = cards.indexOf(card);
      if(i > -1) {
        _cards = cards.splice(i, 1);
      }
    }

    public function resetPositions():void {
      var i:int = 0;

      for each(var card:Card in cards) {
        TweenLite.to(card, 0.3, {
          x: 13 + i * (card.width + 6), 
          ease: Quart.easeOut
        });
        i++;
      }
    }
  }
}
