package
{
  import org.flixel.*;
  import org.flixel.plugin.photonstorm.*;
  import flash.geom.Rectangle;

  public class PlayState extends FlxState
  {
    [Embed(source = '../data/04b03.ttf', fontFamily="zerofour", embedAsCFF="false")] public var ZeroFour:String;

    override public function create():void {
      FlxG.mouse.show();
      add(new ScrollingBackground());

      FlxG.playMusic(Assets.BattleMusic);
      var HUD:FlxSprite = new FlxSprite();
      HUD.loadGraphic(Assets.BattleHud, false, false, 320, 240);
      add(HUD);

      G.player = new Player();
      add(G.player);
      G.player.beginTurn();

      var e:FlxSprite = new FlxSprite(FlxG.width/2-45,50);
      e.loadGraphic(Assets.DonutEnemy, true, false, 90, 81);
      e.frame = 1;
      add(e);

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
