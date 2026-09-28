package omnix.ai;
import omnix.core.OmnixID;
import omnix.web.OmnixWebAgent;
import omnix.shaders.OmnixShaderAIController;
import omnix.ai.draw.OmnixDrawAIController;
import omnix.ai.draw.OmnixAnimationController;
import omnix.ai.chart.OmnixChartAI;
import omnix.fx.OmnixFXGenerator;
import omnix.modding.OmnixModProject;
import omnix.core.OmnixTestRunner;

class OmnixAgentOrchestrator {
 public var omnixId:String;
 public var context:OmnixProjectContext;
 public var web:OmnixWebAgent;
 public var shader:OmnixShaderAIController;
 public var draw:OmnixDrawAIController;
 public var animation:OmnixAnimationController;
 public var chart:OmnixChartAI;
 public var fx:OmnixFXGenerator;
 public var project:OmnixModProject;
 public var tests:OmnixTestRunner;
 public var currentTask:OmnixAgentTask;

 public function new(?provider:OmnixAIProvider) {
  omnixId=OmnixID.random("ORCHESTRATOR");
  context=new OmnixProjectContext();
  web=new OmnixWebAgent();
  shader=new OmnixShaderAIController(provider);
  draw=new OmnixDrawAIController();
  animation=new OmnixAnimationController();
  chart=new OmnixChartAI();
  fx=new OmnixFXGenerator();
  project=new OmnixModProject();
  tests=new OmnixTestRunner();
 }
 public function start(goal:String):OmnixAgentTask {
  currentTask=new OmnixAgentTask(goal);
  currentTask.status="planning";
  route(goal);
  return currentTask;
 }
 public function route(goal:String):Void {
  var g=goal.toLowerCase();
  if(g.indexOf("shader")>=0 || g.indexOf("glitch")>=0 || g.indexOf("rgb")>=0) currentTask.addStep("shader");
  if(g.indexOf("character")>=0 || g.indexOf("draw")>=0 || g.indexOf("postać")>=0) currentTask.addStep("draw");
  if(g.indexOf("animation")>=0 || g.indexOf("anim")>=0) currentTask.addStep("animation");
  if(g.indexOf("chart")>=0 || g.indexOf("notes")>=0 || g.indexOf("nut")>=0) currentTask.addStep("chart");
  if(g.indexOf("fx")>=0 || g.indexOf("effect")>=0 || g.indexOf("corruption")>=0) currentTask.addStep("fx");
  if(g.indexOf("web")>=0 || g.indexOf("github")>=0 || g.indexOf("documentation")>=0) currentTask.addStep("web");
  if(currentTask.steps.length==0) currentTask.addStep("project");
  currentTask.status="planned";
 }
 public function finish():Void if(currentTask!=null) currentTask.status="completed";
}