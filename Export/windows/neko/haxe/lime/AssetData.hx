package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/img/character/doofus.png", "assets/img/character/doofus.png");
			type.set ("assets/img/character/doofus.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/img/character/doofus.psd", "assets/img/character/doofus.psd");
			type.set ("assets/img/character/doofus.psd", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("assets/img/character/doofusTiles.png", "assets/img/character/doofusTiles.png");
			type.set ("assets/img/character/doofusTiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/character/doofus.png", "img/character/doofus.png");
			type.set ("img/character/doofus.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("img/character/doofus.psd", "img/character/doofus.psd");
			type.set ("img/character/doofus.psd", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("img/character/doofusTiles.png", "img/character/doofusTiles.png");
			type.set ("img/character/doofusTiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
