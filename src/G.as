package
{
    import org.flixel.*;
    import components.MP3Pitch;

    public class G
    {
        public var _game:FlxGame;

        private static var _instance:G = null;

        public function G() {
        }

        private static function get instance():G {
            if(_instance == null) {
                _instance = new G();
                _instance._hueShift = 0;
            }

            return _instance;
        }

        public static function get game():FlxGame {
          return instance._game;
        }

        public static function set game(value:FlxGame):void {
          instance._game = value;
        }
    }
}
