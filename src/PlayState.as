package
{
  import org.flixel.*;

  public class PlayState extends FlxState
  {
    [Embed(source = '../data/04b03.ttf', fontFamily="zerofour", embedAsCFF="false")] public var ZeroFour:String;

    override public function create():void {
      if(G.player == null) {
        G.player = new Player();
      }

    }
  }
}
