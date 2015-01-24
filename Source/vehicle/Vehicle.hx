package vehicle ;

import openfl.display.Sprite;

/**
 * ...
 * @author ...
 */
class Vehicle extends Sprite
{
	
	public var platforms:Array<Sprite>;
	var terrain:Terrain;
	var speed:Int = 4;
	
	public function new(xPos:Int, yPos:Int, terrainRef:Terrain ) 
	{
		super();
		
		platforms = new Array<Sprite>();
		
		draw();
		
		for(platform in platforms){
			addChild(platform);
		}
		
		this.x = xPos;
		this.y = yPos;
		terrain = terrainRef;
	}
	
	function draw()
	{
		var platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 20, 200);
		platform.x = 150;
		platform.y = -100;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 200, 10);
		platform.x = -100;
		platform.y = 100;
		platforms.push(platform);
		
		//graphics.beginFill(0x00ff00);
		//graphics.drawRoundRect(-100, -100, 200, 200, 10, 10);
		//graphics.endFill();
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