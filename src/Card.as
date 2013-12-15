package
{
  import org.flixel.*;

  public class Card extends FlxSprite {
    public var stats:Object = {
      attack: 0, heal: 0, actions: 0, cards: 0
    };

    public function Card(stats:Object=null) {
      if(stats) {
        for(var prop:String in this.stats) {
          this.stats[prop] = stats[prop] == null ? this.stats[prop] : stats[prop];
        }
      } else {
        //Use G.player.level later
      }
    }
  }
}
