e
{
  import org.flixel.*;

  public class ScrollingBackground extends FlxGroup
  {
    public function ScrollingBackground() {
      add(new FlxScrollZone());

      var backgroundSprite:FlxSprite;
      var i:int = 0, j:int = 0;

      do {
        do {
          backgroundSprite = new FlxSprite();
          backgroundSprite.loadGraphic(Assets.PinkDiamonds);
          backgroundSprite.x = backgroundSprite.width * i;
          backgroundSprite.y = backgroundSprite.height * j;
          add(backgroundSprite);
          FlxScrollZone.add(backgroundSprite, new Rectangle(0, 0, backgroundSprite.width, backgroundSprite.height), -2, -1);
          FlxScrollZone.startScrolling(backgroundSprite);
          j++;
        } while (backgroundSprite.y < FlxG.height/2);
        i++;
      } while (backgroundSprite.x < FlxG.width);
    }
  }
}

