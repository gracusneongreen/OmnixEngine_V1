package omnix.ai;
import omnix.core.OmnixID;
class OmnixAgentTask {
 public var omnixId:String; public var goal:String; public var status:String; public var steps:Array<String>;
 public function new(goal:String) { omnixId=OmnixID.random("TASK"); this.goal=goal; status="created"; steps=[]; }
 public function addStep(step:String):Void steps.push(step);
}