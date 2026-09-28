package omnix.core;

class OmnixTestRunner {
    public var passed:Int = 0;
    public var failed:Int = 0;

    public function run(name:String, test:Void->Bool):Bool {
        var ok = false;
        try { ok = test(); } catch (e:Dynamic) { ok = false; }
        if (ok) passed++; else failed++;
        return ok;
    }

    public function summary():String return "passed=" + passed + " failed=" + failed;
}
