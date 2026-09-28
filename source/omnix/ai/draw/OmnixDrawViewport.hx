package omnix.ai.draw;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxTypedGroup;

class OmnixDrawViewport extends FlxTypedGroup<FlxSprite> {
    public var editor:OmnixDrawEditorState;
    public var selectedSprite:FlxSprite;
    public var canvasX:Float;
    public var canvasY:Float;
    public var dragging:Bool;
    var dragOffsetX:Float;
    var dragOffsetY:Float;
    var sprites:Map<String, FlxSprite>;

    public function new(editor:OmnixDrawEditorState, ?canvasX:Float = 0, ?canvasY:Float = 0) {
        super();
        this.editor = editor;
        this.canvasX = canvasX;
        this.canvasY = canvasY;
        dragging = false;
        dragOffsetX = 0;
        dragOffsetY = 0;
        sprites = new Map<String, FlxSprite>();
        rebuild();
    }

    public function rebuild():Void {
        clear();
        sprites = new Map<String, FlxSprite>();

        var ordered = editor.project.layers.copy();
        ordered.sort(function(a:OmnixDrawLayer, b:OmnixDrawLayer):Int {
            return a.zIndex - b.zIndex;
        });

        for (layer in ordered) {
            var sprite = createSprite(layer);
            sprites.set(layer.partId, sprite);
            add(sprite);
        }
    }

    function createSprite(layer:OmnixDrawLayer):FlxSprite {
        var sprite = new FlxSprite();
        if (layer.assetPath != null && layer.assetPath != "") {
            sprite.loadGraphic(layer.assetPath);
        } else {
            var size = layer.width > 0 ? layer.width : 80;
            var height = layer.height > 0 ? layer.height : 80;
            sprite.makeGraphic(size, height, 0x6677AAFF);
        }

        sprite.x = canvasX + layer.transform.x;
        sprite.y = canvasY + layer.transform.y;
        sprite.angle = layer.transform.rotation;
        sprite.scale.x = layer.transform.scaleX;
        sprite.scale.y = layer.transform.scaleY;
        sprite.alpha = layer.alpha;
        sprite.visible = layer.visible;
        return sprite;
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if (FlxG.mouse.justPressed) {
            var partId = hitTest();
            if (partId != "") {
                editor.select(partId);
                selectedSprite = sprites.get(partId);
                dragging = true;

                var layer = editor.getSelectedLayer();
                if (layer != null && selectedSprite != null) {
                    dragOffsetX = FlxG.mouse.x - selectedSprite.x;
                    dragOffsetY = FlxG.mouse.y - selectedSprite.y;
                }
            }
        }

        if (dragging && selectedSprite != null && FlxG.mouse.pressed) {
            var targetX = FlxG.mouse.x - dragOffsetX;
            var targetY = FlxG.mouse.y - dragOffsetY;
            editor.moveSelected(targetX - canvasX, targetY - canvasY);
            syncSelected();
        }

        if (dragging && FlxG.mouse.justReleased) {
            dragging = false;
        }
    }

    function hitTest():String {
        var bestId = "";
        var bestZ = -999999;

        for (layer in editor.project.layers) {
            if (!layer.visible) continue;
            var sprite = sprites.get(layer.partId);
            if (sprite == null) continue;

            var w = sprite.width;
            var h = sprite.height;
            if (FlxG.mouse.x >= sprite.x && FlxG.mouse.x <= sprite.x + w &&
                FlxG.mouse.y >= sprite.y && FlxG.mouse.y <= sprite.y + h) {
                if (layer.zIndex >= bestZ) {
                    bestZ = layer.zIndex;
                    bestId = layer.partId;
                }
            }
        }
        return bestId;
    }

    public function syncSelected():Void {
        if (editor.selectedPart == "") return;
        var layer = editor.getSelectedLayer();
        var sprite = sprites.get(editor.selectedPart);
        if (layer == null || sprite == null) return;

        sprite.x = canvasX + layer.transform.x;
        sprite.y = canvasY + layer.transform.y;
        sprite.angle = layer.transform.rotation;
        sprite.scale.x = layer.transform.scaleX;
        sprite.scale.y = layer.transform.scaleY;
        sprite.alpha = layer.alpha;
        sprite.visible = layer.visible;
    }

    public function rotateSelected(degrees:Float):Void {
        if (editor.selectedPart == "") return;
        editor.rotateSelected(degrees);
        syncSelected();
    }

    public function scaleSelected(multiplier:Float):Void {
        if (editor.selectedPart == "") return;
        editor.scaleSelected(multiplier, multiplier);
        syncSelected();
    }
}
