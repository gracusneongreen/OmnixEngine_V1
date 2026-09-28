package omnix.ai;
import omnix.core.OmnixID;
class OmnixAICore {
 public var omnixId:String;
 public var provider:OmnixAIProvider;
 public var orchestrator:OmnixAgentOrchestrator;
 public var systemPrompt:String;
 public function new(?provider:OmnixAIProvider) {
  omnixId=OmnixID.random("AI_CORE");
  this.provider=provider;
  orchestrator=new OmnixAgentOrchestrator(provider);
  systemPrompt="You are Omnix AI Core. Plan tasks, use the appropriate Omnix specialist, preserve project context, validate actions, test results, and never claim an operation succeeded unless it was actually executed.";
 }
 public function plan(goal:String):OmnixAgentTask return orchestrator.start(goal);
 public function addContextFile(path:String):Void orchestrator.context.addFile(path);
 public function addContextNote(note:String):Void orchestrator.context.addNote(note);
}