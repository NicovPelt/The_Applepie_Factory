package vehicle ;

import openfl.display.Sprite;

/**
 * ...
 * @author ...
 */
class Vehicle extends Sprite
{
	
	public var platform:Sprite;
	var terrain:Terrain;
	var speed:Int = 4;
	var arm = new ArmSegment();
	var arm2 = new ArmSegment();
	public var armGrabber = new ArmGrabber();
	
	public function new(xPos:Int, yPos:Int, terrainRef:Terrain ) 
	{
		super();
		
		platform = new Sprite();
		
		draw();
		
		addChild(platform);
		
		this.x = xPos;
		this.y = yPos;
		terrain = terrainRef;
		
		addChild(arm);
		arm.addChild(arm2);
		arm2.addChild(armGrabber);
		arm2.x = arm.width;
		arm2.y = 0;
		armGrabber.x = arm2.width;
		arm.x = 0;
		arm.y = -100;
	}
	
	function draw()
	{
		
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect(100,100,200,10);
		
		graphics.beginFill(0x00ff00);
		graphics.drawRoundRect(-100, -100, 200, 200, 10, 10);
		graphics.endFill();
	}
	
	public function update()
	{
		moveRight();
		arm.rotation += 5;
		arm2.rotation -= 5;
		armGrabber.update();
		armGrabber.rotation += 5;
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