package vehicle ;

import openfl.display.Sprite;

/**
 * ...
 * @author Matthijs van Gelder
 */
class VehicleControl extends Sprite
{

	public var controlType : String ;
	
	public function new() 
	{
		super();
		draw();
	}
	function draw()
	{
		graphics.beginFill(0x00ff00);
		graphics.drawCircle(0, 0, 10);
		graphics.endFill();
	}
}