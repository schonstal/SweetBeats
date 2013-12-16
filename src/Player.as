package
{
  import org.flixel.*;
  import com.greensock.*;
  import com.greensock.easing.*;

  public class Player extends FlxGroup
  {
    private var deck:Deck;
    private var hand:Hand;
    private var discard:Array;

    public function Player() {
      deck = new Deck();
      hand = new Hand();
      discard = new Array();

      add(hand);
    }

    public function drawHand():void {
      if(hand.count < 3) {
        FlxG.log('drawing card ' + hand.count);
        new FlxTimer().start(0.3, 1, function():void { drawHand() });
        drawCard();
      }
    }

    public function drawCard(callback:Function=null):void {
      var card:Card = deck.drawCard();
      FlxG.log(hand.contains(card));
      card.x = -card.width;
      FlxG.log(''+card.stats.attack+card.stats.heal);
      FlxG.log(deck.count);
      hand.addCard(card);
      
      TweenLite.to(card, 0.3, {
          x: (hand.count-1) * card.width,
          ease: Quart.easeOut,
          onComplete: function():void {
            if(callback) callback();
          }
        });
    }

  }
}
