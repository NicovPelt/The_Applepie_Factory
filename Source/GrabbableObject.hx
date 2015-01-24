package ;

import openfl.display.Sprite;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.Assets;

/**
 * ...
 * @author Matthijs van Gelder
 */
class GrabbableObject extends Sprite
{

	public function new() 
	{
		super();
		draw();
	}
	function draw()
	{
		var bitmapData:BitmapData = Assets.getBitmapData("assets/img/Items/Rock.png");
		var bitmap = new Bitmap(bitmapData);
		bitmap.y = -22;
		bitmap.x = -39;
		bitmap.scaleX = bitmap.scaleY = 1.5;
		addChild(bitmap);
	}
}