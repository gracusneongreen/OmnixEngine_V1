package omnix.shaders;
class OmnixShaderValidator {
 public static function validate(source:String):String { if(source==null||StringTools.trim(source)=="")return "EMPTY"; var s=source.toLowerCase(); if(s.indexOf("sampler2d")>=0)return "TEXTURE_SAMPLER_NOT_ALLOWED"; if(s.indexOf("texture2d")>=0)return "TEXTURE_FUNCTION_NOT_ALLOWED"; if(s.indexOf("tex2d")>=0)return "TEXTURE_FUNCTION_NOT_ALLOWED"; return "OK"; }
}