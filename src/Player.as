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
        new FlxTimer().start(0.1, 1, function():void { drawHand() });
        drawCard();
      }
    }

    public function drawCard(callback:Function=null):void {
      var card:Card = deck.drawCard();
      card.x = -card.width;
      hand.addCard(card);
      
      TweenLite.to(card, 0.3, {
          x: 14 + (hand.count-1) * (card.width + 6),
          ease: Quart.easeOut,
          onComplete: function():void {
            if(callback) callback();
          }
        });
    }
  }
}
