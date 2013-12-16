package
{
  import org.flixel.*;

  public class Card extends FlxSprite {
    public static const TYPES:Array = ['attack', 'heal', 'card', 'action'];
    public static const COLORS:Object = {
      attack: 0xffff9999,
      heal: 0xff7affa6,
      action: 0xfffff47c,
      card: 0xff83d8ff
    };

    public var stats:Object = {
      attack: 0,
      heal: 0,
      action: 0,
      card: 0
    };

    public function Card(stats:Object=null) {
      if(stats) {
        for(var prop:String in this.stats)
          this.stats[prop] = stats[prop] == null ? this.stats[prop] : stats[prop];
      } else {
        //Use G.player.level later
      }

      createGraphic();
    }

    public function createGraphic():void {
      makeGraphic(44, 64, 0, true);

      var brush:FlxSprite = new FlxSprite();

      var t:FlxText;
      var y:Number = 2;

      var numStats:int = 0;
      var priority:Array = TYPES.concat();
      priority.sort(function(a:String, b:String):int {
        if (stats[a]<stats[b]) {
          return -1;
        } else if (stats[a]>stats[b]) {
          return 1;
        } else {
          return 0;
        }
      });

      for(var k:String in stats) {
        if(stats[k] > 0) numStats++;
      }

      FlxG.log(priority);
      if(numStats == 1) {
        FlxG.log('yo1');
        brush.makeGraphic(40, 60, COLORS[priority[0]]);
        stamp(brush, 2, 2);
      } else if(numStats == 2) {
        FlxG.log('yo2');
        brush.makeGraphic(40, 30, COLORS[priority[0]]); 
        stamp(brush, 2, 2);

        brush.makeGraphic(40, 30, COLORS[priority[1]]); 
        stamp(brush, 2, 32);
      } else if(numStats == 3) {
        brush.makeGraphic(40, 30, COLORS[priority[0]]); 
        stamp(brush, 2, 2);

        brush.makeGraphic(20, 30, COLORS[priority[1]]); 
        stamp(brush, 2, 32);

        brush.makeGraphic(20, 30, COLORS[priority[2]]); 
        stamp(brush, 22, 32);
      } else if(numStats == 4) {
        brush.makeGraphic(20, 30, COLORS[priority[0]]); 
        stamp(brush, 2, 2);
        stampIcon(priority[0], 4, 4);

        brush.makeGraphic(20, 30, COLORS[priority[1]]); 
        stamp(brush, 22, 2);

        brush.makeGraphic(20, 30, COLORS[priority[2]]); 
        stamp(brush, 2, 32);

        brush.makeGraphic(20, 30, COLORS[priority[3]]); 
        stamp(brush, 22, 32);
      }

      brush.loadGraphic(Assets.CardBorder);
      stamp(brush);
    }

    private function stampIcon(stat, x:Number, y:Number):void {
      stamp(G.iconSprite.setIcon(stat, stats[stat]), x, y);
    }
  }
}
