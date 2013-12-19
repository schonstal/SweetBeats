package
{
  import org.flixel.*;
  import org.flixel.plugin.photonstorm.*;

  public class PlayState extends FlxState
  {
    [Embed(source = '../data/04b03.ttf', fontFamily="zerofour", embedAsCFF="false")] public var ZeroFour:String;

    override public function create():void {
      FlxG.mouse.show();

      var enemySprite:FlxSprite = new FlxSprite();
      enemySprite.loadGraphic(Assets.EnemyPlaceholder);
      enemySprite.ignoreHue = false;
      add(enemySprite);

      //FlxG.playMusic(Assets.BattleMusic);
      var HUD:FlxSprite = new FlxSprite();
      HUD.loadGraphic(Assets.BattleHud, false, false, 320, 240);
      add(HUD);

      G.player = new Player();
      add(G.player);
      G.player.beginTurn();

      G.lightMask = new LightMask();
      add(G.lightMask);

      G.overlay = new Overlay();
      add(G.overlay);
    }

    override public function update():void {
      G.hueShift += 20 * FlxG.elapsed;
      if(FlxG.keys.justPressed("SPACE")) FlxG.switchState(new PlayState());
      super.update();
    }

  }
}
