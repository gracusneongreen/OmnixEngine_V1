package omnix.ai.draw;

import haxe.Json;

class OmnixXMLExporter {
    public static function build(sheet:OmnixSpriteSheetBuilder):String {
        var out = '<?xml version="1.0" encoding="UTF-8"?>\n<TextureAtlas imagePath="character.png">\n';
        for (i in 0...sheet.frameNames.length) {
            var col = i % sheet.columns;
            var row = Std.int(i / sheet.columns);
            var name = sheet.frameNames[i];
            out += '  <SubTexture name="' + escape(name) + '" x="' + (col * sheet.frameWidth) +
                '" y="' + (row * sheet.frameHeight) + '" width="' + sheet.frameWidth +
                '" height="' + sheet.frameHeight + '" />\n';
        }
        return out + '</TextureAtlas>';
    }

    private static function escape(value:String):String {
        return StringTools.replace(StringTools.replace(StringTools.replace(value, "&", "&amp;"), '"', "&quot;"), "<", "&lt;");
    }
}
