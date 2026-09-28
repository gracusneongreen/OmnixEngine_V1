package omnix.shaders;
import omnix.ai.OmnixAIProvider;
import omnix.core.OmnixID;
class OmnixShaderChatAI {
 public var omnixId:String; public var provider:OmnixAIProvider; public var systemPrompt:String;
 public function new(?provider:OmnixAIProvider) { omnixId=OmnixID.random("SHADER_CHAT_AI"); this.provider=provider; systemPrompt="You are Omnix Shader AI. Create original realtime procedural shaders using pure mathematics. Never require PNG JPG sprites image textures sampler2D texture2D or external assets. Use UV time BPM sin cos atan length fract floor smoothstep hash gradients RGB separation and mathematical fields. Return engine-compatible shader source and parameters."; }
 public function ask(request:String,callback:String->Void,?onError:String->Void):Void { if(provider==null){if(onError!=null)onError("Shader AI provider is not configured.");return;} provider.chat(systemPrompt+"\nUser request: "+request,callback,onError); }
}