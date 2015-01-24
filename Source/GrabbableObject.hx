package ;

import openfl.display.Sprite;

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
		graphics.beginFill(0x000000);
		graphics.drawCircle(0, 0, 40);
		graphics.endFill();
	}
}