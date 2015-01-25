package;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.Assets;
import haxe.Timer;

/**
 * ...
 * @author Andor
 */
class Particle extends Sprite 
{

	public var vel_x : Float = 0 ;
	public var vel_y : Float = 0 ;
	public var acc_x : Float = 0 ;
	public var acc_y : Float = 0 ;
	public var scale_inc : Float = 0 ;
	public var fadetime : Float = 0 ;
	
	var particlesystem : ParticleSystem ;
	var smokeTest :BitmapData = Assets.getBitmapData("img/SmokeTest.png");
	
	public function new(input:ParticleSystem) 
	{
		super();
		draw ();
		particlesystem = input ;
		
		Timer.delay(death, 3000);
	}
	
	function draw():Void
	{
		var bitmapData:BitmapData = smokeTest;
		var bitmap = new Bitmap( bitmapData );
		addChild( bitmap );
		bitmap.x = bitmap.x - bitmap.width / 2;
		bitmap.y = bitmap.y - bitmap.height / 2;
	}
	
	function death()
	{
		particlesystem.removeChild (this);
	}
}