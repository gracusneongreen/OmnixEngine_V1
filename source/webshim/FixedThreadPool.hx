package webshim;

#if js
class FixedThreadPool {
	public function new(count:Int) {}
	public function run(f:Void->Void):Void f();
	public function shutdown():Void {}
}
#end
