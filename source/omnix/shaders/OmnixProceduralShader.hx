package omnix.shaders;
import omnix.core.OmnixID;
class OmnixProceduralShader {
 public var omnixId:String; public var name:String; public var fragmentSource:String; public var vertexSource:String; public var parameters:Map<String,Float>;
 public function new(name:String, fragmentSource:String, ?vertexSource:String="") { omnixId=OmnixID.make("SHADER",name); this.name=name; this.fragmentSource=fragmentSource; this.vertexSource=vertexSource; parameters=new Map<String,Float>(); }
 public function setParameter(name:String,value:Float):Void parameters.set(name,value);
 public function getParameter(name:String,?fallback:Float=0):Float return parameters.exists(name)?parameters.get(name):fallback;
}