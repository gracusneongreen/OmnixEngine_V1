package omnix.lang;

class OmnixLanguageRegistry {
    public var languages:Array<OmnixLanguageSpec>;

    public function new() {
        languages = OmnixLanguageSpec.defaults();
    }

    public function findByExtension(extension:String):OmnixLanguageSpec {
        for (language in languages) {
            if (language.extension == extension) return language;
        }
        return null;
    }

    public function has(id:String):Bool {
        for (language in languages) {
            if (language.id == id) return true;
        }
        return false;
    }
}
