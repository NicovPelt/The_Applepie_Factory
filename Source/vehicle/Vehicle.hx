package vehicle ;

import openfl.display.Sprite;

/**
 * ...
 * @author ...
 */
class Vehicle extends Sprite
{

	public function new(xPos:Int, yPos:Int) 
	{
		super();
		draw();
		this.x = xPos;
		this.y = yPos;
	}
	
	function draw()
	{
		graphics.beginFill(0x00ff00);
		graphics.drawRoundRect(0, 0, 200, 200, 10, 10);
		graphics.endFill();
	}
}