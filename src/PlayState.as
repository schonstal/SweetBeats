package
{
  import org.flixel.*;

  public class PlayState extends FlxState
  {
    [Embed(source = '../data/04b03.ttf', fontFamily="zerofour", embedAsCFF="false")] public var ZeroFour:String;

    override public function create():void {
      var HUD:FlxSprite = new FlxSprite();
      HUD.loadGraphic(Assets.BattleHud);
      add(HUD);

      G.player = new Player();
      add(G.player);
      G.player.drawHand();
    }

    override public function update():void {
      if(FlxG.keys.justPressed("SPACE")) FlxG.switchState(new PlayState());
      super.update();
    }

  }
}
