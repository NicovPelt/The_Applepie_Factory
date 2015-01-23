package vehicle ;

import openfl.display.Sprite;

/**
 * ...
 * @author ...
 */
class Vehicle extends Sprite
{

	public function new() 
	{
		super();
		var terrain = new Terrain();
		addChild(terrain);
	}
	
}