package
{
  import org.flixel.*;

  public class Deck
  {
    private var cards:Array = [];
    private var discard:Array = [];

    public function Deck() {
      for(var i:int = 0; i < 5; i++) {
        cards.push(new Card({attack: 1}));
        cards.push(new Card({heal: 1}));
      }

      shuffle();
      for each(var card:Card in cards) FlxG.log(card.stats['attack'] + ' ' + card.stats['heal']);
    }

    public function shuffle():void {
      var shuffledCards:Array = cards.concat();

      for(var i:int = 0; i < cards.length; i++) {
        var a:int = Math.floor(Math.random() * cards.length);
        shuffledCards[i] = shuffledCards[a];
        shuffledCards[a] = cards[i];
      }

      cards = shuffledCards;
    }
  }
}
