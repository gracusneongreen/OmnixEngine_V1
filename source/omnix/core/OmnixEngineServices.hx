package omnix.core;
import omnix.ai.OmnixAICore;
class OmnixEngineServices {
 public static var ai:OmnixAICore;
 public static function initialize(?provider:Dynamic):Void {
  ai=new OmnixAICore(cast provider);
 }
 public static function shutdown():Void ai=null;
}