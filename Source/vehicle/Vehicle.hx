package vehicle ;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;

/**
 * ...
 * @author ...
 */
class Vehicle extends Sprite
{
	
	public var vehicleControles:Array<VehicleControl>;
	public var platforms:Array<Sprite>;
	var terrain:Terrain;
	var speed:Int = 4;
	var arm = new ArmSegment("assets/img/Arm1.png");
	var arm2 = new ArmSegment("assets/img/Arm2.png");
	public var armGrabber = new ArmGrabber();
	var vehicleControl = new VehicleControl ();
	
	public function new(xPos:Int, yPos:Int, terrainRef:Terrain ) 
	{
		super();
		
		platforms = new Array<Sprite>();
		vehicleControles = new Array<VehicleControl>();
		
		draw();
		
		for(platform in platforms){
			addChild(platform);
		}
		
		this.x = xPos;
		this.y = yPos;
		terrain = terrainRef;
		
		addChild(arm);
		arm.addChild(arm2);
		arm2.addChild(armGrabber);
		arm2.x = arm.width - 50;
		arm2.y = 0;
		armGrabber.x = arm2.width - 50;
		arm.x = 0;
		arm.y = -100;
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	function init(e:Event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, changeMove);
	}
	
	function changeMove(e:KeyboardEvent)
	{
		if (e.keyCode == Keyboard.LEFT)
		{
			moveLeft();
		}
		else if (e.keyCode == Keyboard.RIGHT)
		{
			moveRight();
		}
	}
	
	public function changeMoveControl (input:String)
	{
		switch (input) 
		{
			case "right" :
				moveRight ();
			case "left" :
				moveLeft ();
			case "stop" :
				moveStop ();
		}

	}
	
	function draw()
	{
		var platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 10, 500);
		platform.x = 350;
		platform.y = -250;
		platforms.push(platform);
		
		var platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 10, 500);
		platform.x = -350;
		platform.y = -240;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 700, 10);
		platform.x = -350;
		platform.y = -250;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 700, 10);
		platform.x = -340;
		platform.y = 250;
		platforms.push(platform);
	
		var vehicleControl = new VehicleControl ();
		addChild (vehicleControl);
		vehicleControl.x = 100 ;
		vehicleControl.y = 250 ;
		vehicleControles.push (vehicleControl);
		vehicleControl.controlType = "move_right" ;
	
		var vehicleControl2 = new VehicleControl ();
		addChild (vehicleControl2);
		vehicleControl2.x = -100 ;
		vehicleControl2.y = 250 ;
		vehicleControles.push (vehicleControl2);
		vehicleControl2.controlType = "move_left" ;
		
	}
	public function update()
	{
		arm.rotation += 5;
		arm2.rotation -= 5;
		armGrabber.update();
		armGrabber.rotation += 5;
	}
	
	function moveLeft()
	{
		terrain.speed = speed;
	}
	function moveRight()
	{
		terrain.speed = -speed;
	}
	function moveStop ()
	{
		terrain.speed = 0;
	}
}