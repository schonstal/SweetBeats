package
{
  import org.flixel.*;
  import com.greensock.*;
  import com.greensock.easing.*;

  public class HealthGroup extends FlxGroup
  {
    private var hearts:Array = [];

    public function HealthGroup(startHealth:uint = 3) {
      var heart:HealthSprite;
      for(var i:uint = 0; i < Player.MAX_HEALTH; i++) {
        heart = new HealthSprite(i);
        add(heart);
        hearts.push(heart);

        if(i < startHealth) heart.forceVisibility();
      }
    }

    public function fillToHealth(health:uint, callback:Function=null):void {
      for(var i:uint = 0; i < health; i++) {
        hearts[i].onTop = true;
      }
      new FlxTimer().start(0.2, 1, function():void {
        for(var i:uint = 0; i < health; i++) {
          hearts[i].appear();
          new FlxTimer().start(0.7, 1, function():void {
            for(var i:uint = 0; i < health; i++) {
              hearts[i].onTop = false;
            }
            if(callback != null) callback();
          });
        }
      });
    }
  }
}
