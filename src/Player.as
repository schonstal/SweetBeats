package
{
  import org.flixel.*;
  import com.greensock.*;
  import com.greensock.easing.*;

  public class Player extends FlxGroup
  {
    public static const MAX_HEALTH:int = 15;
    public static const MAX_ACTIONS:int = 5;

    //Cards
    private var deck:Deck;
    private var hand:Hand;
    private var discard:Array;
    private var dummyCards:FlxGroup;
    private var healthGroup:HealthGroup;

    //Stats
    private var health:int = 3;
    private var actions:int = 0;

    //Flags
    private var _canSelect:Boolean = false;
    public function get canSelect():Boolean { return _canSelect; }

    public function Player() {
      deck = new Deck();
      hand = new Hand();
      discard = new Array();
      healthGroup = new HealthGroup();

      dummyCards = new FlxGroup();

      add(hand);
      add(deck);
      add(dummyCards);
      add(healthGroup);
    }

    public function beginTurn():void {
      gainActions(1);
      drawHand();
    }

    public function endTurn():void {
      discardHand();
      for each(var dummyCard:DummyCard in dummyCards.members) {
        dummyCard.exists = false;
      }
    }

    public function gainActions(count:int):void {
      actions++;
    }

    public function gainHealth(count:int, callback:Function=null):void {
      health = health + count;
      healthGroup.fillToHealth(health, callback);
    }

    public function takeDamage(count:int):void {
    }

    public function performActions(card:Card):void {
      if(card.stats.card > 0) {
        drawCard();
        new FlxTimer().start(0.1, 1, function():void { drawCard(function():void { card.discard(cardDone); }); });
      }

      if(card.stats.heal > 0) {
        gainHealth(card.stats.heal, function():void { card.discard(cardDone) });
      }

      if(card.stats.attack) {
        FlxG.shake(0.01, 0.3, function():void { card.discard(cardDone) });
      }
    }

    public function cardDone():void {
      G.lightMask.fadeOut();
      _canSelect = true;
    }

    public function discardHand():void {
      var card:Card;

      if(hand.count > 0) {
        new FlxTimer().start(0.1, 1, function():void { discardHand() });
        card = hand.cards[hand.cards.length-1];
        card.discard(function():void {
          hand.removeCard(card);
        });
      } else {
        new FlxTimer().start(0.3, 1, function():void {
          _canSelect = true;
        });
      }
    }

    public function drawHand():void {
      if(hand.count < 3) {
        new FlxTimer().start(0.1, 1, function():void { drawHand() });
        drawCard();
      } else {
        new FlxTimer().start(0.3, 1, function():void {
          _canSelect = true;
        });
      }
    }

    public function selectCard(card:Card):void {
      G.lightMask.fadeIn();
      card.onTop = true;
      _canSelect = false;
      hand.removeCard(card);
      add(card);

      TweenLite.to(card, 0.2, {
        y: FlxG.height + card.height,
        ease: Quart.easeIn,
        onComplete: function():void {
          hand.resetPositions();
          card.x = 10;//FlxG.width/2 - card.width/2;
          card.y = -card.height;
          TweenLite.to(card, 0.2, {
            y: 26,
            ease: Quart.easeOut,
            onComplete: function():void {
              performActions(card);
            }
          });
        }
      });
    }

    public function drawCard(callback:Function=null):void {
      var dummyCard:DummyCard;
      var card:Card = deck.drawCard();
      card.x = -card.width;
      hand.addCard(card);
      var destination:Number = 13 + (hand.count-1) * (card.width + 6);
      FlxG.log(destination);

      dummyCard = dummyCards.recycle(DummyCard) as DummyCard;
      dummyCard.initialize();
      dummyCards.sort("x", DESCENDING);

      TweenLite.to(dummyCard, 0.2, {
        x: -dummyCard.width,
        ease: Linear.easeNone,
        onComplete: function():void {
          TweenLite.to(card, 0.3, {
            x: destination, 
            ease: Quart.easeOut,
            onComplete: function():void {
              if(callback != null) callback();
            }
          });
        }
      });
    }
  }
}
