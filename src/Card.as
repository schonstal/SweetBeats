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
    public static const BORDER_COLORS:Object = {
      attack: 0xff562f36,
      heal: 0xff2e493d,
      card: 0xff2c455b,
      action: 0xff4b4231
    }

    public var stats:Object = {
      attack: 0,
      heal: 0,
      action: 0,
      card: 0
    };

    public function Card(stats:Object=null) {
      y = 171;
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
        if (stats[a]>stats[b]) {
          return -1;
        } else if (stats[a]<stats[b]) {
          return 1;
        } else {
          return 0;
        }
      });

      for(var k:String in stats) {
        if(stats[k] > 0) numStats++;
      }

      FlxG.log(priority);
      FlxG.log(stats[priority[0]]);
      if(numStats == 1) {
        stampSection(0,0,priority[0],1);
      } else if(numStats == 2) {
        stampSection(0,0,priority[0],2);
        stampSection(0,1,priority[1],2);
      } else if(numStats == 3) {
        stampSection(0,0,priority[0],2);
        stampSection(0,1,priority[1],3);
        stampSection(1,1,priority[2],3);
      } else if(numStats == 4) {
        stampSection(0,0,priority[0],3);
        stampSection(1,0,priority[1],3);
        stampSection(0,1,priority[2],3);
        stampSection(1,1,priority[3],3);
      }

      brush.loadGraphic(Assets.CardBorder);
      stamp(brush);
    }

    private function stampSection(x:int, y:int, stat:String, size:uint):void {
      var brush:FlxSprite = new FlxSprite();
      brush.makeGraphic(size > 2 ? 19 : 38, size > 1 ? 29 : 58, COLORS[stat], true, stats[stat] + stat + size);
      if(size < 3) {
        brush.stamp(new NumberSprite(stats[stat]), brush.width/2 - 10, brush.height/2 - 4);
        brush.stamp(G.iconSprite.setIcon(stat, stats[stat]), brush.width/2 - 3, brush.height/2 - 8);
        brush.replaceColor(0xff000000, BORDER_COLORS[stat]);
      } else {
        brush.stamp(G.iconSprite.setIcon(stat, stats[stat]), brush.width/2 - 8, brush.height/2 - 8);
      }
      stamp(brush, 3 + 19 * x, 3 + 29 * y);
    }
  }
}
