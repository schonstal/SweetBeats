package
{
  import org.flixel.*;

  public class MenuState extends FlxState
  {
    override public function create():void {
      FlxG.mouse.show();
      //FlxG.playMusic(Assets.Music);
      var title:FlxSprite = new FlxSprite();
      title.loadGraphic(Assets.Title);
      add(title);
    }

    override public function update():void {
      if(FlxG.mouse.justPressed()) {
        FlxG.fade(0xffffffff, 1, function():void {
          FlxG.switchState(new PlayState());
        });
      }
      super.update();
    }
  }
}
