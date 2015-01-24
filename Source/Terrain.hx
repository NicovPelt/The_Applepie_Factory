package ;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

/**
 * ...
 * @author Matthijs van Gelder
 */
class Terrain extends Sprite
{
	public var gap:Gap = new Gap();
	public var speed:Float = -4;
	var bitmap:Bitmap;
	var bitmap2:Bitmap;
	var bitmap3:Bitmap;
	var bitmap4:Bitmap;
	var bitmap5:Bitmap;
	public var gaps:Array<Gap> = new Array<Gap>();
	
	
	
	public function new() 
	{
		super();
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
		
		addChild(bitmap3);
		addChild(bitmap2);
		addChild(bitmap);
		addChild(bitmap5);
		addChild(bitmap4);
		
		this.y = 0;
	}
	
	public function addObject(object:GrabbableObject) {
		addChild(object);
		var gap:Gap = new Gap(object);
		addChild(gap);
		gaps.push(gap);
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
	}
}