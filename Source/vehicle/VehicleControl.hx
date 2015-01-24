package vehicle ;

import openfl.display.Sprite;

/**
 * ...
 * @author Matthijs van Gelder
 */
class VehicleControl extends Sprite
{

	public var controlType : String ;
	
	public function new(controlType:String) 
	{
		super();
		this.controlType = controlType;
		draw();
	}
	function draw()
	{
		graphics.beginFill(0x00ff00);
		graphics.drawCircle(0, 0, 10);
		graphics.endFill();
	}
}