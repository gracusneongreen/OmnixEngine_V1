package webshim;

#if js
class Thread {
	public function new() {}
	public static function create(func:Void->Void):Thread return new Thread();
	public static function currentThread():Thread return new Thread();
	public function sendMessage(msg:Dynamic):Void {}
}
#end
