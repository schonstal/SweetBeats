package
{
  import org.flixel.*;

  public class PlayState extends FlxState
  {
    [Embed(source = '../data/04b03.ttf', fontFamily="zerofour", embedAsCFF="false")] public var ZeroFour:String;

    override public function create():void {
      FlxG.playMusic(Assets.Music);
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
