package
{
  import org.flixel.*;

  public class Deck extends FlxSprite
  {
    private var cards:Array = [];

    public function Deck() {
      loadGraphic(Assets.Deck, true, false, 23, 33);
      x = 9;
      y = 128;

      for(var i:int = 0; i < 4; i++) {
        cards.push(new Card({attack: 3, card: 2, action: 1}));
      }
      for(i = 0; i < 2; i++) {
        cards.push(new Card({heal:3, attack: 2}));
      }

      cards.push(new Card({card: 1, action: 3}));

      shuffle();
    }

    public function shuffle():void {
      var shuffledCards:Array = new Array(cards.length);
 
      var randomPos:Number = 0;
      for (var i:int = 0; i < shuffledCards.length; i++)
      {
          randomPos = int(Math.random() * cards.length);
          shuffledCards[i] = cards[randomPos];    //note this the other way around to the naive approach
          cards.splice(randomPos, 1);
      }

      cards = shuffledCards;
    }

    public function drawCard():Card {
      return cards.pop();
    }

    public function get count():uint {
      return cards.length;
    }

    public override function update():void {
      visible = count > 0;
    }
  }
}
