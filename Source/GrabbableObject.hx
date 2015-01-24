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
	
	var gravity:Int;
	var yVelocity:Int;
	var xVelocity:Int;
	var minGroundLevel:Int;
	public var grabbed:Bool;
	
	public function new() 
	{
		super();
		draw();
		gravity = 4;
		minGroundLevel = 950;
	}
	
	public function update()
	{
		if (this.y < minGroundLevel)
		{
			yVelocity += gravity;
		}
		else
		{
			yVelocity = 0;
		}
		if (!grabbed)
		{
			this.y += yVelocity;
		}
		else
		{
			yVelocity = 0;
		}
	}
	
	function draw()
	{
		var bitmapData:BitmapData = Assets.getBitmapData("assets/img/Items/Rock.png");
		var bitmap = new Bitmap(bitmapData);
		bitmap.y = -bitmap.height/2;
		bitmap.x = -bitmap.width/2;
		addChild(bitmap);
	}
}