package ;

import lime.graphics.opengl.GLUniformLocation;
import openfl.display.Sprite;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.Assets;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import openfl.Assets.loadSound;

/**
 * ...
 * @author Matthijs van Gelder
 */
class GrabbableObject extends Sprite
{
	// sound system stuff
	var bangSound = Assets.getSound("audio/GGJ_bang.wav");
	var errorSound = Assets.getSound("audio/GGJ_error.wav");
	var rockSound = Assets.getSound("audio/GGJ_rock.wav");
	var switchSound = Assets.getSound("audio/GGJ_switch_1.wav");
	var toneSound = Assets.getSound("audio/GGJ_tone.wav");
	
	var soundVolume: Float = 1;
	var soundChannel:SoundChannel;
	
	var gravity:Int;
	var yVelocity:Int;
	var xVelocity:Int;
	var onGround = false;
	public var minGroundLevel:Int;
	public var grabbed:Bool;
	public var inGap:Bool = false;

	
	public function new() 
	{
		super();
		draw();
		gravity = 4;
		minGroundLevel = 980;
	}
	
	public function update()
	{
		if (this.y < minGroundLevel)
		{
			yVelocity += gravity;
			onGround = false;
		}
		else
		{
			
			yVelocity = 0;
			this.y = minGroundLevel;
			if(!onGround)hitGround();
		}
		if (!grabbed)
		{
			this.y += yVelocity;
		}
		else
		{
			yVelocity = 0;
			onGround = false;
			inGap = false;
		}
		if (inGap) {
			minGroundLevel = Math.round(stage.stageHeight - this.height /2);
		}else {
			minGroundLevel = 980;
		}
	}
	
	function hitGround()
	{
		onGround = true;
		soundChannel = bangSound.play(0, 0, new SoundTransform(soundVolume));
	}
	
	function draw()
	{
		var bitmapData:BitmapData = Assets.getBitmapData("assets/img/Items/Rock.png");
		var bitmap = new Bitmap(bitmapData);
		bitmap.y = -bitmap.height/2;
		bitmap.x = -bitmap.width/2;
		addChild(bitmap);
	}
}