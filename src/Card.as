package
{
  import org.flixel.*;

  public class Card extends FlxSprite {
    public var stats:Object = {
      attack: 0, heal: 0, action: 0, card: 0
    };

    public function Card(stats:Object=null) {
      if(stats) {
        for(var prop:String in this.stats) {
          this.stats[prop] = stats[prop] == null ? this.stats[prop] : stats[prop];
        }
      } else {
        //Use G.player.level later
      }

      createGraphic();
    }

    public function createGraphic():void {
      makeGraphic(44, 64, 0xffffeeee, true);

      var t:FlxText;
      var y:Number = 2;

      for(var k:String in stats) {
        t = new FlxText(0, 0, width,
          k.substr(0,1).toUpperCase() + 
          k.substr(k.length - 1, k.length).toUpperCase() + 
          ": " + stats[k]);

        t.size = 8;
        t.color = 0xff000000;

        stamp(t, 0, y);
        y += 10;
      }
    }
  }
}
