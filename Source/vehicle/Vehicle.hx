package vehicle ;

import openfl.display.Sprite;

/**
 * ...
 * @author ...
 */
class Vehicle extends Sprite
{
	
	public var platform:Sprite;

	public function new(xPos:Int, yPos:Int) 
	{
		super();
		
		platform = new Sprite();
		
		draw();
		
		addChild(platform);
		
		this.x = xPos;
		this.y = yPos;
	}
	
	function draw()
	{
		
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect(100,100,200,10);
		
		//graphics.beginFill(0x00ff00);
		//graphics.drawRoundRect(0, 0, 200, 200, 10, 10);
		//graphics.endFill();
	}
}