package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Font;
import lime.graphics.Image;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if (sys || nodejs)
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/img/Background/Level_1_background_1.png", __ASSET__assets_img_background_level_1_background_1_png);
		type.set ("assets/img/Background/Level_1_background_1.png", AssetType.IMAGE);
		className.set ("assets/img/Background/Level_1_background_2.png", __ASSET__assets_img_background_level_1_background_2_png);
		type.set ("assets/img/Background/Level_1_background_2.png", AssetType.IMAGE);
		className.set ("assets/img/Background/Level_1_background_space.png", __ASSET__assets_img_background_level_1_background_space_png);
		type.set ("assets/img/Background/Level_1_background_space.png", AssetType.IMAGE);
		className.set ("assets/img/Background/level_1_ground.png", __ASSET__assets_img_background_level_1_ground_png);
		type.set ("assets/img/Background/level_1_ground.png", AssetType.IMAGE);
		className.set ("assets/img/Background/level_1_ground_2.png", __ASSET__assets_img_background_level_1_ground_2_png);
		type.set ("assets/img/Background/level_1_ground_2.png", AssetType.IMAGE);
		className.set ("assets/img/character/doofus.png", __ASSET__assets_img_character_doofus_png);
		type.set ("assets/img/character/doofus.png", AssetType.IMAGE);
		className.set ("assets/img/character/doofus.psd", __ASSET__assets_img_character_doofus_psd);
		type.set ("assets/img/character/doofus.psd", AssetType.BINARY);
		className.set ("assets/img/character/doofusTiles.png", __ASSET__assets_img_character_doofustiles_png);
		type.set ("assets/img/character/doofusTiles.png", AssetType.IMAGE);
		className.set ("assets/img/Items/Rock.png", __ASSET__assets_img_items_rock_png);
		type.set ("assets/img/Items/Rock.png", AssetType.IMAGE);
		className.set ("img/Background/Level_1_background_1.png", __ASSET__img_background_level_1_background_1_png);
		type.set ("img/Background/Level_1_background_1.png", AssetType.IMAGE);
		className.set ("img/Background/Level_1_background_2.png", __ASSET__img_background_level_1_background_2_png);
		type.set ("img/Background/Level_1_background_2.png", AssetType.IMAGE);
		className.set ("img/Background/Level_1_background_space.png", __ASSET__img_background_level_1_background_space_png);
		type.set ("img/Background/Level_1_background_space.png", AssetType.IMAGE);
		className.set ("img/Background/level_1_ground.png", __ASSET__img_background_level_1_ground_png);
		type.set ("img/Background/level_1_ground.png", AssetType.IMAGE);
		className.set ("img/Background/level_1_ground_2.png", __ASSET__img_background_level_1_ground_2_png);
		type.set ("img/Background/level_1_ground_2.png", AssetType.IMAGE);
		className.set ("img/character/doofus.png", __ASSET__img_character_doofus_png);
		type.set ("img/character/doofus.png", AssetType.IMAGE);
		className.set ("img/character/doofus.psd", __ASSET__img_character_doofus_psd);
		type.set ("img/character/doofus.psd", AssetType.BINARY);
		className.set ("img/character/doofusTiles.png", __ASSET__img_character_doofustiles_png);
		type.set ("img/character/doofusTiles.png", AssetType.IMAGE);
		className.set ("img/Items/Rock.png", __ASSET__img_items_rock_png);
		type.set ("img/Items/Rock.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "assets/img/Background/Level_1_background_1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/img/Background/Level_1_background_2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/img/Background/Level_1_background_space.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/img/Background/level_1_ground.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/img/Background/level_1_ground_2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/img/character/doofus.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/img/character/doofus.psd";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/img/character/doofusTiles.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/img/Items/Rock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Background/Level_1_background_1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Background/Level_1_background_2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Background/Level_1_background_space.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Background/level_1_ground.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Background/level_1_ground_2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/character/doofus.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/character/doofus.psd";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "img/character/doofusTiles.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/Items/Rock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		/*var useManifest = false;
		
		className.set ("assets/img/Background/Level_1_background_1.png", __ASSET__assets_img_background_level_1_background_1_png);
		type.set ("assets/img/Background/Level_1_background_1.png", AssetType.IMAGE);
		
		className.set ("assets/img/Background/Level_1_background_2.png", __ASSET__assets_img_background_level_1_background_2_png);
		type.set ("assets/img/Background/Level_1_background_2.png", AssetType.IMAGE);
		
		className.set ("assets/img/Background/Level_1_background_space.png", __ASSET__assets_img_background_level_1_background_space_png);
		type.set ("assets/img/Background/Level_1_background_space.png", AssetType.IMAGE);
		
		className.set ("assets/img/Background/level_1_ground.png", __ASSET__assets_img_background_level_1_ground_png);
		type.set ("assets/img/Background/level_1_ground.png", AssetType.IMAGE);
		
		className.set ("assets/img/Background/level_1_ground_2.png", __ASSET__assets_img_background_level_1_ground_2_png);
		type.set ("assets/img/Background/level_1_ground_2.png", AssetType.IMAGE);
		
		className.set ("assets/img/character/doofus.png", __ASSET__assets_img_character_doofus_png);
		type.set ("assets/img/character/doofus.png", AssetType.IMAGE);
		
		className.set ("assets/img/character/doofus.psd", __ASSET__assets_img_character_doofus_psd);
		type.set ("assets/img/character/doofus.psd", AssetType.BINARY);
		
		className.set ("assets/img/character/doofusTiles.png", __ASSET__assets_img_character_doofustiles_png);
		type.set ("assets/img/character/doofusTiles.png", AssetType.IMAGE);
		
		className.set ("assets/img/Items/Rock.png", __ASSET__assets_img_items_rock_png);
		type.set ("assets/img/Items/Rock.png", AssetType.IMAGE);
		
		className.set ("img/Background/Level_1_background_1.png", __ASSET__img_background_level_1_background_1_png);
		type.set ("img/Background/Level_1_background_1.png", AssetType.IMAGE);
		
		className.set ("img/Background/Level_1_background_2.png", __ASSET__img_background_level_1_background_2_png);
		type.set ("img/Background/Level_1_background_2.png", AssetType.IMAGE);
		
		className.set ("img/Background/Level_1_background_space.png", __ASSET__img_background_level_1_background_space_png);
		type.set ("img/Background/Level_1_background_space.png", AssetType.IMAGE);
		
		className.set ("img/Background/level_1_ground.png", __ASSET__img_background_level_1_ground_png);
		type.set ("img/Background/level_1_ground.png", AssetType.IMAGE);
		
		className.set ("img/Background/level_1_ground_2.png", __ASSET__img_background_level_1_ground_2_png);
		type.set ("img/Background/level_1_ground_2.png", AssetType.IMAGE);
		
		className.set ("img/character/doofus.png", __ASSET__img_character_doofus_png);
		type.set ("img/character/doofus.png", AssetType.IMAGE);
		
		className.set ("img/character/doofus.psd", __ASSET__img_character_doofus_psd);
		type.set ("img/character/doofus.psd", AssetType.BINARY);
		
		className.set ("img/character/doofusTiles.png", __ASSET__img_character_doofustiles_png);
		type.set ("img/character/doofusTiles.png", AssetType.IMAGE);
		
		className.set ("img/Items/Rock.png", __ASSET__img_items_rock_png);
		type.set ("img/Items/Rock.png", AssetType.IMAGE);
		*/
		var useManifest = true;
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && requestedType == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return AudioBuffer.fromFile (path.get (id));
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		//return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		//else 
		return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Dynamic /*Font*/ {
		
		// TODO: Complete Lime Font API
		
		#if openfl
		#if (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), openfl.text.Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			openfl.text.Font.registerFont (fontClass);
			return cast (Type.createInstance (fontClass, []), openfl.text.Font);
			
		} else {
			
			return new openfl.text.Font (path.get (id));
			
		}
		
		#end
		#end
		
		return null;
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		return Image.fromFile (path.get (id));
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getAudioBuffer (id));
			
		//}
		
		#else
		
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_img_background_level_1_background_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_img_background_level_1_background_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_img_background_level_1_background_space_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_img_background_level_1_ground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_img_background_level_1_ground_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_img_character_doofus_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_img_character_doofus_psd extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_img_character_doofustiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_img_items_rock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_background_level_1_background_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_background_level_1_background_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_background_level_1_background_space_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_background_level_1_ground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_background_level_1_ground_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_character_doofus_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_character_doofus_psd extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__img_character_doofustiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_items_rock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5

#if openfl



















#end

#else

#if openfl

#end

#if (windows || mac || linux)

//
//@:bitmap("Assets/img/Background/Level_1_background_1.png") class __ASSET__assets_img_background_level_1_background_1_png extends openfl.display.BitmapData {}
//@:bitmap("Assets/img/Background/Level_1_background_2.png") class __ASSET__assets_img_background_level_1_background_2_png extends openfl.display.BitmapData {}
//@:bitmap("Assets/img/Background/Level_1_background_space.png") class __ASSET__assets_img_background_level_1_background_space_png extends openfl.display.BitmapData {}
//@:bitmap("Assets/img/Background/level_1_ground.png") class __ASSET__assets_img_background_level_1_ground_png extends openfl.display.BitmapData {}
//@:bitmap("Assets/img/Background/level_1_ground_2.png") class __ASSET__assets_img_background_level_1_ground_2_png extends openfl.display.BitmapData {}
//@:bitmap("Assets/img/character/doofus.png") class __ASSET__assets_img_character_doofus_png extends openfl.display.BitmapData {}
//@:file("Assets/img/character/doofus.psd") class __ASSET__assets_img_character_doofus_psd extends lime.utils.ByteArray {}
//@:bitmap("Assets/img/character/doofusTiles.png") class __ASSET__assets_img_character_doofustiles_png extends openfl.display.BitmapData {}
//@:bitmap("Assets/img/Items/Rock.png") class __ASSET__assets_img_items_rock_png extends openfl.display.BitmapData {}
//@:bitmap("assets/img/Background/Level_1_background_1.png") class __ASSET__img_background_level_1_background_1_png extends openfl.display.BitmapData {}
//@:bitmap("assets/img/Background/Level_1_background_2.png") class __ASSET__img_background_level_1_background_2_png extends openfl.display.BitmapData {}
//@:bitmap("assets/img/Background/Level_1_background_space.png") class __ASSET__img_background_level_1_background_space_png extends openfl.display.BitmapData {}
//@:bitmap("assets/img/Background/level_1_ground.png") class __ASSET__img_background_level_1_ground_png extends openfl.display.BitmapData {}
//@:bitmap("assets/img/Background/level_1_ground_2.png") class __ASSET__img_background_level_1_ground_2_png extends openfl.display.BitmapData {}
//@:bitmap("assets/img/character/doofus.png") class __ASSET__img_character_doofus_png extends openfl.display.BitmapData {}
//@:file("assets/img/character/doofus.psd") class __ASSET__img_character_doofus_psd extends lime.utils.ByteArray {}
//@:bitmap("assets/img/character/doofusTiles.png") class __ASSET__img_character_doofustiles_png extends openfl.display.BitmapData {}
//@:bitmap("assets/img/Items/Rock.png") class __ASSET__img_items_rock_png extends openfl.display.BitmapData {}
//
//

#end

#end
#end

