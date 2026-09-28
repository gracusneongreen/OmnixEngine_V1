package omnix.ai.draw;

import haxe.Json;

class OmnixDrawProject {
    public var name:String;
    public var canvasWidth:Int;
    public var canvasHeight:Int;
    public var layers:Array<OmnixDrawLayer>;

    public function new(?name:String = "Untitled Omnix Character", ?canvasWidth:Int = 1280, ?canvasHeight:Int = 720) {
        this.name = name;
        this.canvasWidth = canvasWidth;
        this.canvasHeight = canvasHeight;
        layers = [];
    }

    public function addLayer(layer:OmnixDrawLayer):Void {
        layers.push(layer);
    }

    public function getLayer(id:String):OmnixDrawLayer {
        for (layer in layers) if (layer.id == id) return layer;
        return null;
    }

    public function removeLayer(id:String):Bool {
        for (i in 0...layers.length) {
            if (layers[i].id == id) {
                layers.splice(i, 1);
                return true;
            }
        }
        return false;
    }

    public function toJson():String {
        var output:Array<Dynamic> = [];
        for (layer in layers) {
            output.push({
                id: layer.id,
                partId: layer.partId,
                assetPath: layer.assetPath,
                visible: layer.visible,
                alpha: layer.alpha,
                zIndex: layer.zIndex,
                width: layer.width,
                height: layer.height,
                x: layer.transform.x,
                y: layer.transform.y,
                rotation: layer.transform.rotation,
                scaleX: layer.transform.scaleX,
                scaleY: layer.transform.scaleY
            });
        }
        return Json.stringify({
            name: name,
            canvasWidth: canvasWidth,
            canvasHeight: canvasHeight,
            layers: output
        });
    }
}
