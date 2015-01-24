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

	public function new() 
	{
		super();
		var bitmapData:BitmapData = Assets.getBitmapData("assets/img/Background/Level_1_background_1.png");
		var bitmap = new Bitmap(bitmapData);
		var bitmapData2:BitmapData = Assets.getBitmapData("assets/img/Background/Level_1_background_2.png");
		var bitmap2 = new Bitmap(bitmapData2);
		var bitmapData3:BitmapData = Assets.getBitmapData("assets/img/Background/Level_1_background_space.png");
		var bitmap3 = new Bitmap(bitmapData3);
		var bitmapData4:BitmapData = Assets.getBitmapData("assets/img/Background/level_1_ground.png");
		var bitmap4 = new Bitmap(bitmapData4);
		var bitmapData5:BitmapData = Assets.getBitmapData("assets/img/Background/level_1_ground_2.png");
		var bitmap5 = new Bitmap(bitmapData5);
		
		addChild(bitmap3);
		addChild(bitmap5);
		addChild(bitmap4);
		addChild(bitmap2);
		addChild(bitmap);
		this.x = 0;
	}
	
	public function update()
	{
	}
}