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
	public var characters:Array<Character> = new Array<Character>();
	var terrain:Terrain;
	var speed:Int = 4;
	var arm = new ArmSegment("assets/img/Arm1_2X.png");
	var arm2 = new ArmSegment("assets/img/Arm2_2X.png");
	public var armGrabber = new ArmGrabber();
	var vehicleControl:VehicleControl;
	var nonePressed:Bool = true;
	
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
		arm2.x = arm.width - 100;
		arm2.y = 0;
		armGrabber.x = arm2.width - 100;
		arm.x = 0;
		arm.y = -200;
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	function init(e:Event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		//stage.addEventListener(KeyboardEvent.KEY_DOWN, changeMove);
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
	
		vehicleControl = new VehicleControl ("move_right");
		addChild (vehicleControl);
		vehicleControl.x = 100 ;
		vehicleControl.y = 250 ;
		vehicleControles.push (vehicleControl);
	
		vehicleControl = new VehicleControl ("move_left");
		addChild (vehicleControl);
		vehicleControl.x = -100 ;
		vehicleControl.y = 250 ;
		vehicleControles.push (vehicleControl);
		
		vehicleControl = new VehicleControl ("move_arm_1L");
		addChild (vehicleControl);
		vehicleControl.x = -100 ;
		vehicleControl.y = 250 ;
		vehicleControles.push (vehicleControl);
		
		vehicleControl = new VehicleControl ("move_arm_1R");
		addChild (vehicleControl);
		vehicleControl.x = -200 ;
		vehicleControl.y = 250 ;
		vehicleControles.push (vehicleControl);
		
		vehicleControl = new VehicleControl ("move_arm_2L");
		addChild (vehicleControl);
		vehicleControl.x = 100 ;
		vehicleControl.y = 250 ;
		vehicleControles.push (vehicleControl);
		
		vehicleControl = new VehicleControl ("move_arm_2R");
		addChild (vehicleControl);
		vehicleControl.x = 200 ;
		vehicleControl.y = 250 ;
		vehicleControles.push (vehicleControl);
		
		vehicleControl = new VehicleControl ("grab");
		addChild (vehicleControl);
		vehicleControl.x = 250 ;
		vehicleControl.y = 250 ;
		vehicleControles.push (vehicleControl);
		
		vehicleControl = new VehicleControl ("release");
		addChild (vehicleControl);
		vehicleControl.x = -250 ;
		vehicleControl.y = 250 ;
		vehicleControles.push (vehicleControl);
		
	}
	public function update()
	{
		armGrabber.update();
		//armGrabber.rotation += 5;
		
		nonePressed = true;
		for (vehicleControl in vehicleControles) {
			for(character in characters){
				if (character.hitTestObject(vehicleControl)) 
				{
					nonePressed = false;
					switch (vehicleControl.controlType) 
					{
						case "move_right" :
							moveRight();
							break ;
						case "move_left" :
							moveLeft();
							break ;
						case "move_arm_1L" :
							moveArm1L();
							break ;
						case "move_arm_1R" :
							moveArm1R();
							break ;
						case "move_arm_2L" :
							moveArm2L();
							break ;
						case "move_arm_2R" :
							moveArm2R();
							break ;
						case "grab" :
							grab();
							break ;
						case "release" :
							release();
							break ;
					}
				}	
			}
		}
		if(nonePressed)
		{
			moveStop();
		}
	}
	
	function moveLeft()
	{
		for (gap in terrain.gaps)
		{
			if (hitTestObject(gap) == false || gap.isFilled == true)
			{
				terrain.speed = speed;
			}
			else terrain.speed = 0;
		}
	}
	function moveRight()
	{
		for (gap in terrain.gaps)
		{
			if (hitTestObject(gap) == false || gap.isFilled == true)
			{
				terrain.speed = -speed;
			}
			else terrain.speed = 0;
		}
	}
	function moveStop ()
	{
		terrain.speed = 0;
	}
	function moveArm1L()
	{
		arm.rotation -= 5;
		armGrabber.rotation += 5;
	}
	function moveArm1R()
	{
		arm.rotation += 5;
		armGrabber.rotation -= 5;
	}
	function moveArm2L()
	{
		arm2.rotation -= 5;
		armGrabber.rotation += 5;
	}
	function moveArm2R()
	{
		arm2.rotation += 5;
		armGrabber.rotation -= 5;
	}
	function grab()
	{
		armGrabber.grabObject();
	}
	function release()
	{
		armGrabber.dropObject();
	}
}