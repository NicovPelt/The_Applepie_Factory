package vehicle ;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import openfl.Assets;

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
			platform.alpha = 0;
		}
		
		var bitmap:Bitmap = new Bitmap(Assets.getBitmapData("assets/img/TempBody.png"));
		addChild(bitmap);
		bitmap.x -= bitmap.width / 2;
		bitmap.y -= bitmap.height / 2 -50;
		
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
		arm.y = -50;
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
		platform.graphics.drawRect( 0, 0, 141, 10);
		platform.x = -64;
		platform.y = 220;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 10, 52);
		platform.x = -74;
		platform.y = 178;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 144, 10);
		platform.x = -218;
		platform.y = 178;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 10, 109);
		platform.x = -218;
		platform.y = 69;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 156, 30);
		platform.x = -217;
		platform.y = 44;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 166, 40);
		platform.x = -377;
		platform.y = 14;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 10, 115);
		platform.x = -375;
		platform.y = -100;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 60, 148);
		platform.x = -375;
		platform.y = -240;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 800, 20);
		platform.x = -375;
		platform.y = -253;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 110, 20);
		platform.x = 186;
		platform.y = -238;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 10, 320);
		platform.x = 380;
		platform.y = -253;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 150, 32);
		platform.x = 262;
		platform.y = -98;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 190, 10);
		platform.x = 200;
		platform.y = 50;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 10, 90);
		platform.x = 195;
		platform.y = 50;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 128, 10);
		platform.x = 70;
		platform.y = 136;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 10, 90);
		platform.x = 70;
		platform.y = 136;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 165, 40);
		platform.x = -223;
		platform.y = -147;
		platforms.push(platform);
		
		platform = new Sprite();
		platform.graphics.beginFill(0x00ff00);
		platform.graphics.drawRect( 0, 0, 220, 35);
		platform.x = -93;
		platform.y = -112;
		platforms.push(platform);
		
		vehicleControl = new VehicleControl ("move_right");
		addChild (vehicleControl);
		vehicleControl.x = 40 ;
		vehicleControl.y = 195 ;
		vehicleControles.push (vehicleControl);
	
		vehicleControl = new VehicleControl ("move_left");
		addChild (vehicleControl);
		vehicleControl.x = -115 ;
		vehicleControl.y = 160 ;
		vehicleControles.push (vehicleControl);
		
		vehicleControl = new VehicleControl ("move_arm_1L");
		addChild (vehicleControl);
		vehicleControl.x = -123 ;
		vehicleControl.y = 35 ;
		vehicleControles.push (vehicleControl);
		
		vehicleControl = new VehicleControl ("move_arm_1R");
		addChild (vehicleControl);
		vehicleControl.x = -192 ;
		vehicleControl.y = -150 ;
		vehicleControles.push (vehicleControl);
		
		vehicleControl = new VehicleControl ("move_arm_2L");
		addChild (vehicleControl);
		vehicleControl.x = 80 ;
		vehicleControl.y = -130 ;
		vehicleControles.push (vehicleControl);
		
		vehicleControl = new VehicleControl ("move_arm_2R");
		addChild (vehicleControl);
		vehicleControl.x = 300 ;
		vehicleControl.y = 40 ;
		vehicleControles.push (vehicleControl);
		
		vehicleControl = new VehicleControl ("grab");
		addChild (vehicleControl);
		vehicleControl.x = 120 ;
		vehicleControl.y = 130 ;
		vehicleControles.push (vehicleControl);
		
		vehicleControl = new VehicleControl ("release");
		addChild (vehicleControl);
		vehicleControl.x = -300 ;
		vehicleControl.y = 0 ;
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