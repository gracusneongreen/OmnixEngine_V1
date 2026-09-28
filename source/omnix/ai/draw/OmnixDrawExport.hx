package omnix.ai.draw;

import haxe.Json;

class OmnixDrawExport {
    public static function rigToJson(rig:OmnixHumanRig):String {
        var output:Array<Dynamic> = [];
        for (id in rig.parts.keys()) {
            var part = rig.parts.get(id);
            output.push({
                id: part.id,
                parent: part.parentId,
                x: part.x,
                y: part.y,
                rotation: part.rotation,
                scaleX: part.scaleX,
                scaleY: part.scaleY
            });
        }
        return Json.stringify({root: rig.root, parts: output});
    }
}
