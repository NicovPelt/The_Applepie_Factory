package vehicle ;
import openfl.display.Sprite;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.Assets;
/**
 * ...
 * @author Matthijs van Gelder
 */
class ArmSegment extends Sprite
{
	var image:String;
	public function new(img:String) 
	{
		super();
		image = img;
		draw();
	}
	
	function draw()
	{
		var bitmapData:BitmapData = Assets.getBitmapData(image);
		var bitmap = new Bitmap(bitmapData);
		bitmap.y = -bitmap.height/2;
		bitmap.x = -bitmap.height/2;
		addChild(bitmap);
	}
}