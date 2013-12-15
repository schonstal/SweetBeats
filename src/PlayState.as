package
{
  import org.flixel.*;

  public class PlayState extends FlxState
  {
    [Embed(source = '../data/04b03.ttf', fontFamily="zerofour", embedAsCFF="false")] public var ZeroFour:String;

    private var cards:Array = [];
    private var health:uint = 20;

    private var healthText:FlxText;

    private var healthBar:FlxSprite;
    private var healthBarShadow:FlxSprite;

    public static const HEALTH_BAR_WIDTH:Number = 264;

    override public function create():void {
      var background:FlxSprite = new FlxSprite();
      background.makeGraphic(FlxG.width, FlxG.height, 0xff00A67C);
      add(background);

      healthText = new FlxText(5, 5, 32, "" + health);
      healthText.color = 0xfff73e5f;
      healthText.shadow = 0xff9b001c;
      healthText.alignment = "right";
      healthText.size = 16;
      add(healthText);

      healthBarShadow = new FlxSprite(41, 12);
      healthBarShadow.makeGraphic(HEALTH_BAR_WIDTH, 10, 0xff9b001c);
      add(healthBarShadow);

      healthBar = new FlxSprite(healthBarShadow.x - 1, healthBarShadow.y - 1);
      healthBar.makeGraphic(HEALTH_BAR_WIDTH, healthBarShadow.height, 0xfff73e5f);
      add(healthBar);

      for(var i:uint = 2; i <= 14; i++) {
        cards.push(new Enemy(i));
        cards.push(new Enemy(i));
        if(i <= 10) {
          cards.push(new Potion(i));
          cards.push(new Weapon(i));
        }
      }

    }

    override public function update():void {
      healthText.text = "" + health;
      if(healthBar.scale.x > health/20) {
        healthBar.scale.x -= (healthBar.scale.x - health/20)/6;
      }
      if(healthBar.scale.x < health/20) {
        healthBar.scale.x += (health/20 - healthBar.scale.x)/6;
      }
      healthBar.offset.x = ((1 - healthBar.scale.x) * healthBar.width) / 2;


      if(FlxG.keys.justPressed("LEFT")) {
        health -= 4;
        FlxG.flash(0xffef002a, 0.3, null, true);
        FlxG.shake(0.01, 0.2);
      }

      if(FlxG.keys.justPressed("RIGHT")) {
        health += 4;
        FlxG.flash(0xff5fd2b5, 0.3, null, true);
      }
      super.update();
    }
  }
}
