package
{
    import org.flixel.*;

    public class G
    {
        public var _game:FlxGame;

        private static var _instance:G;
        private var _player:Player;
        private var _hueShift:Number;
        private var _iconSprite:IconSprite;

        public function G() {
        }

        private static function get instance():G {
            if(_instance == null) {
                _instance = new G();
                _instance._hueShift = 0;
                _instance._iconSprite = new IconSprite();
            }

            return _instance;
        }

        public static function get game():FlxGame {
          return instance._game;
        }

        public static function set game(value:FlxGame):void {
          instance._game = value;
        }

        public static function get player():Player {
          return instance._player;
        }

        public static function set player(value:Player):void {
          instance._player = value;
        }

        public static function get iconSprite():IconSprite {
          return instance._iconSprite;
        }

        public static function set iconSprite(value:IconSprite):void {
          instance._iconSprite = value;
        }

        public static function get hueShift():Number {
          return instance._hueShift;
        }

        public static function set hueShift(value:Number):void {
          instance._hueShift = value;
        }

    }
}
