package webshim;

#if js
class Sys {
	public static function sleep(seconds:Float):Void {}
	public static function command(cmd:String):Int return 0;
	public static function exit(code:Int):Void {}
	public static function println(s:Dynamic):Void js.Browser.console.log(s);
	public static function print(s:Dynamic):Void js.Browser.console.log(s);
	public static function getCwd():String return "/";
	public static function setCwd(path:String):Void {}
	public static function programPath():String return "";
	public static function getEnv(name:String):String return null;
	public static function putEnv(name:String, value:String):Void {}
	public static function cpuTime():Float return 0.0;
	public static function time():Float return haxe.Timer.stamp();
	public static function systemName():String return "JS";
}
#end
