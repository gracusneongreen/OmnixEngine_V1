package omnix.ai.draw;

import haxe.Json;

class OmnixDrawProjectIO {
    public static function fromJson(raw:String):OmnixDrawProject {
        var data:Dynamic = Json.parse(raw);
        var project = new OmnixDrawProject(
            Std.string(data.name),
            Std.int(data.canvasWidth),
            Std.int(data.canvasHeight)
        );

        if (!Reflect.hasField(data, "layers")) return project;

        for (item in (cast data.layers:Array<Dynamic>)) {
            var layer = new OmnixDrawLayer(
                Std.string(item.id),
                Std.string(item.partId),
                Reflect.hasField(item, "assetPath") ? Std.string(item.assetPath) : ""
            );
            layer.visible = Reflect.hasField(item, "visible") ? item.visible : true;
            layer.alpha = Reflect.hasField(item, "alpha") ? item.alpha : 1;
            layer.zIndex = Reflect.hasField(item, "zIndex") ? Std.int(item.zIndex) : 0;
            layer.width = Reflect.hasField(item, "width") ? Std.int(item.width) : 0;
            layer.height = Reflect.hasField(item, "height") ? Std.int(item.height) : 0;
            layer.transform.x = Reflect.hasField(item, "x") ? item.x : 0;
            layer.transform.y = Reflect.hasField(item, "y") ? item.y : 0;
            layer.transform.rotation = Reflect.hasField(item, "rotation") ? item.rotation : 0;
            layer.transform.scaleX = Reflect.hasField(item, "scaleX") ? item.scaleX : 1;
            layer.transform.scaleY = Reflect.hasField(item, "scaleY") ? item.scaleY : 1;
            project.addLayer(layer);
        }
        return project;
    }
}
