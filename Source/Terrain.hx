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
	public var speed:Float = -4;
	public var rock:GrabbableObject = new GrabbableObject();
	var bitmap:Bitmap;
	var bitmap2:Bitmap;
	var bitmap3:Bitmap;
	var bitmap4:Bitmap;
	var bitmap5:Bitmap;
	
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
		addChild(rock);
		rock.x = 1000;
		rock.y = 500;
	}
	
	public function update()
	{
		bitmap.x += speed * .6;
		bitmap2.x += speed * .2;
		bitmap3.x += speed * .1;
		bitmap4.x += speed * 1;
		bitmap5.x += speed * 1;
		rock.update();
	}
}