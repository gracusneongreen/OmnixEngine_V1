package webshim;

#if js
import haxe.io.Bytes;

class File {
	public static function getContent(path:String):String {
		try {
			if (openfl.utils.Assets.exists(path, TEXT))
				return openfl.utils.Assets.getText(path);
		} catch(e:Dynamic) {}
		return null;
	}

	public static function saveContent(path:String, content:String):Void {}

	public static function getBytes(path:String):Bytes {
		try {
			if (openfl.utils.Assets.exists(path, BINARY))
				return openfl.utils.Assets.getBytes(path);
		} catch(e:Dynamic) {}
		return null;
	}

	public static function saveBytes(path:String, bytes:Bytes):Void {}
}
#end
