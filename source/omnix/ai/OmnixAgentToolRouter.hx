package omnix.ai;
class OmnixAgentToolRouter {
 public static function normalize(tool:String):String {
  if(tool==null)return "project";
  var t=tool.toLowerCase();
  if(t=="shader"||t=="shader_ai")return "shader";
  if(t=="draw"||t=="draw_ai")return "draw";
  if(t=="animation"||t=="animation_ai")return "animation";
  if(t=="chart"||t=="chart_ai")return "chart";
  if(t=="fx"||t=="fx_ai")return "fx";
  if(t=="web"||t=="web_ai")return "web";
  if(t=="debug"||t=="debug_ai")return "debug";
  if(t=="computer"||t=="computer_use")return "computer";
  return "project";
 }
}