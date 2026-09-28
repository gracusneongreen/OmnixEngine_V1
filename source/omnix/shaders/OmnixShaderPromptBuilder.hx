package omnix.shaders;
class OmnixShaderPromptBuilder {
 public static function build(effect:String,bpm:Float=100):String return "Create an original procedural shader named '"+effect+"'. BPM="+bpm+". NO PNG, NO JPG, NO image texture and NO sampler2D. Use only mathematical fields plus UV/time/BPM/intensity. Target realtime FNF gameplay and mobile performance.";
}