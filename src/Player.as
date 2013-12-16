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

    private var dummyCards:FlxGroup;

    public function Player() {
      deck = new Deck();
      hand = new Hand();
      discard = new Array();

      dummyCards = new FlxGroup();

      add(hand);
      add(deck);
      add(dummyCards);
    }

    public function drawHand():void {

      if(hand.count < 3) {
        new FlxTimer().start(0.1, 1, function():void { drawHand() });
        drawCard();
      }
    }

    public function drawCard(callback:Function=null):void {
      var dummyCard:DummyCard;
      var card:Card = deck.drawCard();
      card.x = -card.width;
      hand.addCard(card);
      var destination:Number = 13 + (hand.count-1) * (card.width + 6);

      dummyCard = dummyCards.recycle(DummyCard) as DummyCard;
      dummyCard.initialize();
      dummyCards.sort("x", DESCENDING);

      TweenLite.to(dummyCard, 0.2, {
        x: -dummyCard.width,
        ease: Linear.easeNone,
        onComplete: function() {
          TweenLite.to(card, 0.3, {
            x: destination, 
            ease: Quart.easeOut,
            onComplete: function():void {
              if(callback) callback();
            }
          });
          dummyCard.exists = false;
        }
      });
    }
  }
}
