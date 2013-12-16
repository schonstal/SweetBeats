package
{
  import org.flixel.*;

  public class Assets
  {
    [Embed(source = '../data/04b03.ttf', fontFamily="zerofour", embedAsCFF="false")] public static var ZeroFour:String;

    [Embed(source = '../data/icons.png')] public static var Icons:Class;
    [Embed(source = '../data/numbers.png')] public static var Numbers:Class;
    [Embed(source = '../data/cardBorder.png')] public static var CardBorder:Class;
    [Embed(source = '../data/battleHud.png')] public static var BattleHud:Class;
    [Embed(source = '../data/deck.png')] public static var Deck:Class;

    [Embed(source = '../data/music/sweet.mp3')] public static var Music:Class;
    [Embed(source = '../data/music/battle.mp3')] public static var BattleMusic:Class;
  }
}
