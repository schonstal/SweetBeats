package
{
  import org.flixel.*;

  public class Deck
  {
    private var cards:Array = [];

    public function Deck() {
      for(var i:int = 0; i < 4; i++) {
        cards.push(new Card({attack:1}));
      }
      for(var i:int = 0; i < 2; i++) {
        cards.push(new Card({heal:2}));
      }

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
  }
}
