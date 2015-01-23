package vehicle ;

import openfl.display.Sprite;

/**
 * ...
 * @author ...
 */
class Vehicle extends Sprite
{
	var terrain:Terrain;
	var speed:Int = 4;
	public function new(xPos:Int, yPos:Int, terrainRef:Terrain ) 
	{
		super();
		draw();
		this.x = xPos;
		this.y = yPos;
		terrain = terrainRef;
	}
	
	function draw()
	{
		graphics.beginFill(0x00ff00);
		graphics.drawRoundRect(-100, -100, 200, 200, 10, 10);
		graphics.endFill();
	}
	
	public function update()
	{
		moveLeft();
	}
	
	function moveLeft()
	{
		terrain.x += speed;
	}
	function moveRight()
	{
		terrain.x -= speed;
	}
}