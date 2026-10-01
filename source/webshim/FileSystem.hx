package webshim;

#if js
class FileSystem {
	public static function exists(path:String):Bool return false;
	public static function readDirectory(path:String):Array<String> return [];
	public static function isDirectory(path:String):Bool return false;
	public static function createDirectory(path:String):Void {}
	public static function deleteFile(path:String):Void {}
	public static function fullPath(path:String):String return path;
}
#end
