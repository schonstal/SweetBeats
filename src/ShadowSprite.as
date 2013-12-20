package
{
  import org.flixel.*;

  public class ShadowSprite extends FlxSprite
  {
    private static var initialized:Object = {};

    public function ShadowSprite(sprite:FlxSprite, cache_key:String='card') {
      makeGraphic(sprite.width, sprite.height, 0, true, cache_key+'shadow');

      if(!initialized[cache_key]) {
        for(var i:int=0; i < sprite.width; i++) {
          for(var j:int=0; j < sprite.height; j++) {
            if(sprite.pixels.getPixel32(i, j) > 0) {
              framePixels.setPixel32(i, j, 0x44000000);
            }
          }
        }
        initialized[cache_key] = true;

        //framePixels won't modify the cache
        stamp(this);
      }
    }
  }
}
