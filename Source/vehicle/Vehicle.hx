package vehicle ;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import openfl.Assets;
import openfl.media.Sound;
import haxe.Timer;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import openfl.Assets.loadSound;
/**
 * ...
 * @author ...
 */
class Vehicle extends Sprite
{
	//sound
	var bangSound = Assets.getSound("audio/GGJ_bang.wav");
	var errorSound = Assets.getSound("audio/GGJ_error.wav");
	var rockSound = Assets.getSound("audio/GGJ_rock.wav");
	var switchSound = Assets.getSound("audio/GGJ_switch_1.wav");
	var toneSound = Assets.getSound("audio/GGJ_tone.wav");
	
	var soundVolume: Float = 2;
	var soundChannel:SoundChannel;
	
	public var vehicleControles:Array<VehicleControl>;
	public var platforms:Array<Sprite>;
	public var characters:Array<Character> = new Array<Character>();
	var terrain:Terrain;
	var speed:Int = 4;
	var rotateSpeed:Int = 2;
	var arm = new ArmSegment("assets/img/Arm1_2X.png");
	var arm2 = new ArmSegment("assets/img/Arm2_2X.png");
	public var armGrabber = new ArmGrabber();
	var vehicleControl:VehicleControl;
	var sortedX:Array<Int> = [-8 ,-175,-163,-137,  40,335,120,-292];
	var sortedY:Array<Int> = [195, 160,  35, -150, -130, 40, 130,   0];
	var lights:Array<Bitmap>;

	var track1:Bitmap;
	var track2:Bitmap;
	
	public function new(xPos:Int, yPos:Int, terrainRef:Terrain ) 
	{
		super();
		
		platforms = new Array<Sprite>();
		vehicleControles = new Array<VehicleControl>();
		
		var bitmap:Bitmap = new Bitmap(Assets.getBitmapData("assets/img/Body1.png"));
		bitmap.x -= bitmap.width / 2;
		bitmap.y -= bitmap.height / 2 -50;
		
		
		draw();
		
		//create lights
		lights = new Array<Bitmap>();
		var light:Bitmap = new Bitmap(Assets.getBitmapData("assets/img/Decor4_Alt.png"));
		light.x = -(bitmap.width / 2)+688;
		light.y = -(bitmap.height / 2 -50) + 474;
		light.rotation += 90;
		lights.push(light);
		light = new Bitmap(Assets.getBitmapData("assets/img/Decor4_Alt.png"));
		light.x = -(bitmap.width / 2)+482;
		light.y = -(bitmap.height / 2 -50) + 410;
		lights.push(light);
		light = new Bitmap(Assets.getBitmapData("assets/img/Decor4_Alt.png"));
		light.x = -(bitmap.width / 2)+500;
		light.y = -(bitmap.height / 2 -50) + 254;
		lights.push(light);
		light = new Bitmap(Assets.getBitmapData("assets/img/Decor4_Alt.png"));
		light.x = -(bitmap.width / 2)+450;
		light.y = -(bitmap.height / 2 -50) + 105;
		lights.push(light);
		light = new Bitmap(Assets.getBitmapData("assets/img/Decor4_Alt.png"));
		light.x = -(bitmap.width / 2)+654;
		light.y = -(bitmap.height / 2 -50) + 105;
		lights.push(light);
		light = new Bitmap(Assets.getBitmapData("assets/img/Decor4_Alt.png"));
		light.x = -(bitmap.width / 2)+996;
		light.y = -(bitmap.height / 2 -50) + 282;
		light.rotation += 90;
		lights.push(light);
		light = new Bitmap(Assets.getBitmapData("assets/img/Decor4_Alt.png"));
		light.x = -(bitmap.width / 2)+672;
		light.y = -(bitmap.height / 2 -50) + 254;
		lights.push(light);
		light = new Bitmap(Assets.getBitmapData("assets/img/Decor4_Alt.png"));
		light.x = -(bitmap.width / 2)+232;
		light.y = -(bitmap.height / 2 -50) + 244;
		lights.push(light);
		
		var temp:Array<Bitmap> = new Array<Bitmap>();
		for (control in vehicleControles) {
			var i:Int = Std.random(sortedX.length);
			control.x = sortedX[i];
			control.y = sortedY[i];
			sortedX.splice(i,1);
			sortedY.splice(i, 1);
			temp.push(lights.splice(i, 1)[0]);
		}
		lights = temp;
		
		for(platform in platforms){
			addChild(platform);
			platform.alpha = 0;
		}
		
		addChild(bitmap);
		
		track1 = new Bitmap(Assets.getBitmapData("assets/img/Tracks1.png"));
		addChild(track1);
		track1.x = bitmap.x + 8;
		track1.y = bitmap.y + 442;	
		
		track2 = new Bitmap(Assets.getBitmapData("assets/img/Tracks1.png"));
		addChild(track2);
		track2.scaleX = -1;
		track2.x = bitmap.x + 1187;
		track2.y = bitmap.y + 442;
		
		for (lichtje in lights) {
			addChild(lichtje);
		}
		
		this.x = xPos;
		this.y = yPos;
		terrain = terrainRef;
		
		addChild(arm);
		arm.addChild(arm2);
		arm2.addChild(armGrabber);
		arm2.x = arm.width - 110;
		arm2.y = 0;
		armGrabber.x = arm2.width - 125;
		arm.x = 242;
		arm.y = -245;
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
		platform.x = 220;
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
		platform.x = 90;
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
		
		var moving = false;
		for (light in lights) {
			light.alpha = 0;
		}
		for (character in characters) {
			var hitButton = false;
			for(vehicleControl in vehicleControles){
			
				if (character.hitTestObject(vehicleControl)) 
				{
					if (character.onButton == false)soundChannel = switchSound.play(0, 0, new SoundTransform(soundVolume));
					hitButton = true;
					character.onButton = true;
					switch (vehicleControl.controlType) 
					{
						case "move_right" :
							moveRight();
							moving = true;
							lights[0].alpha = 1;
							break ;
						case "move_left" :
							moveLeft();
							moving = true;
							lights[1].alpha = 1;
							break ;
						case "move_arm_1L" :
							moveArm1L();
							lights[2].alpha = 1;
							break ;
						case "move_arm_1R" :
							moveArm1R();
							lights[3].alpha = 1;
							break ;
						case "move_arm_2L" :
							moveArm2L();
							lights[4].alpha = 1;
							break ;
						case "move_arm_2R" :
							moveArm2R();
							lights[5].alpha = 1;
							break ;
						case "grab" :
							grab();
							lights[6].alpha = 1;
							break ;
						case "release" :
							release();
							lights[7].alpha = 1;
							break ;
					}
				}
			}
			if (!hitButton)
			{
				character.onButton = false;
			}
		}
		if(!moving)
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
		if (hitTestObject(terrain.mountDoom)) {
			terrain.speed = 0;
		}
	}
	function moveRight()
	{
		for (gap in terrain.gaps)
		{
			if ((!hitTestObject(gap) || gap.isFilled) && !hitTestObject(terrain.pillar))
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
		arm.rotation -= rotateSpeed;
		armGrabber.rotation += rotateSpeed;
	}
	function moveArm1R()
	{
		arm.rotation += rotateSpeed;
		armGrabber.rotation -= rotateSpeed;
	}
	function moveArm2L()
	{
		arm2.rotation -= rotateSpeed;
		armGrabber.rotation += rotateSpeed;
	}
	function moveArm2R()
	{
		arm2.rotation += rotateSpeed;
		armGrabber.rotation -= rotateSpeed;
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