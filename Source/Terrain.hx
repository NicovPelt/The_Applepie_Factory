package ;

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
		graphics.beginFill(0x000000);
		graphics.drawRect(0, 540, 500, 500);
		graphics.endFill();
		this.x = 500;
	}
	
	public function update()
	{
	}
}