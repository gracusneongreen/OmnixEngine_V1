package omnix.shaders;
class OmnixProceduralShaderLibrary {
 public static function rgbPulse():String return make("rgb_pulse","sin(uv.x*18.0+t*3.0)+cos(uv.y*14.0-t*2.0)");
 public static function glitch():String return make("glitch","step(0.82,fract(sin(uv.y*91.7+t*13.1)*43758.5453))");
 public static function wave():String return make("wave","sin(length(uv)*20.0-t*5.0)");
 public static function scanlines():String return make("scanlines","sin(uv.y*420.0)*0.5+0.5");
 public static function vortex():String return make("vortex","sin(atan(uv.y,uv.x)*8.0+length(uv)*18.0-t*4.0)");
 public static function corruption():String return make("corruption","sin(uv.x*33.0+t*7.0)*cos(uv.y*27.0-t*5.0)");
 static function make(name:String,expr:String):String return "// OMNIX PROCEDURAL "+name+" - NO TEXTURES\nfloat field="+expr+";\nfloat v=0.5+0.5*tanh(field);\nvec3 color=vec3(v,v*0.35,1.0-v);";
}