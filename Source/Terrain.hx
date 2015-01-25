package ;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Matthijs van Gelder
 */
class Terrain extends Sprite
{
	public var speed:Float = -4;
	var bitmap:Bitmap;
	var bitmap2:Bitmap;
	var bitmap3:Bitmap;
	var bitmap4:Bitmap;
	var bitmap5:Bitmap;
	var bitmap6:Bitmap;
	
	public var mountDoom:Bitmap;
	public var gaps:Array<Gap> = new Array<Gap>();
	var particleSystem : ParticleSystem ;
	
	public var pillar:Pillar;	
	
	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);

		var bitmapData:BitmapData = Assets.getBitmapData("assets/img/Background/Level_1_background_1.png");
		bitmap = new Bitmap(bitmapData);
		var bitmapData2:BitmapData = Assets.getBitmapData("assets/img/Background/Level_1_background_2.png");
		bitmap2 = new Bitmap(bitmapData2);
		var bitmapData3:BitmapData = Assets.getBitmapData("assets/img/Background/Level_1_background_space.png");
		bitmap3 = new Bitmap(bitmapData3);
		var bitmapData4:BitmapData = Assets.getBitmapData("assets/img/Background/level_1_ground.png");
		bitmap4 = new Bitmap(bitmapData4);
		var bitmapData5:BitmapData = Assets.getBitmapData("assets/img/Background/level_1_ground_2.png");
		bitmap5 = new Bitmap(bitmapData5);
		mountDoom = new Bitmap(Assets.getBitmapData("img/Background/left_wall_scale.png"));
		
		var creditsMap:BitmapData = Assets.getBitmapData("assets/img/Background/level_3_ground.png");
		bitmap6 = new Bitmap(creditsMap);
		addChild(bitmap3);
		addChild(bitmap2);
		addChild(bitmap);
		addChild(bitmap5);
		addChild(bitmap4);
		addChild(bitmap6);
		addChild(mountDoom);
		this.y = 0;
	}
	function init(e:Event) {
		mountDoom.y = stage.stageHeight - mountDoom.height;
		
		particleSystem = new ParticleSystem ("smoke");
		addChild (particleSystem);
		particleSystem.x = 0 ;
		particleSystem.y = 0 ;
		particleSystem.particleSpawn_x = 440 ;
		particleSystem.particleSpawn_y = 640 ;
		bitmap6.x = bitmap4.width;
	}
	
	public function addObject(object:GrabbableObject) 
	{
		addChild(object);
	}
	
	public function update()
	{
		bitmap.x -= speed * .4;
		bitmap2.x -= speed * .8;
		bitmap3.x -= speed * .9;
		this.x += speed;
		//bitmap4.x += speed * 1;
		//bitmap5.x += speed * 1;
		
		for (gap in gaps) {
			gap.update();
		}
		pillar.update();
		particleSystem.particleSpawn_x -= speed ;
		particleSystem.update();
	}
}