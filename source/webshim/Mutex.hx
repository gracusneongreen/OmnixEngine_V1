package webshim;

#if js
class Mutex {
	public function new() {}
	public function acquire():Void {}
	public function release():Void {}
}
#end
