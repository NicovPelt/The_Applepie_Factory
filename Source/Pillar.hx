package ;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.Event;
import haxe.Timer;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import openfl.Assets.loadSound;
/**
 * ...
 * @author ...
 */
class Pillar extends Sprite
{
	var soundVolume: Float = 4;
	var soundChannel:SoundChannel;
	var bangSound = Assets.getSound("audio/GGJ_bang.wav");
	
	var rock:GrabbableObject;
	var pillarGraphics:Bitmap = new Bitmap(Assets.getBitmapData("assets/img/Background/Wall/Fixed1.png"));
	public var destroyed:Bool = false;
	var frame:Int = 1;

	public function new(rock:GrabbableObject) 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
		this.rock = rock;
		this.x = 5750;
		this.y = 320;
	}
	
	function init(e:Event) {
		drawGap();
		addChild(pillarGraphics);
	}
	
	function drawGap() {
		
		this.x = 5750;
		this.y = 320;
	}
	
	public function update() {
		if (this.hitTestObject(rock) && !destroyed) {
			destroyed = true;
			crumble();
		}
	}
	
	function crumble() {
		if (frame < 6) {
			soundChannel = bangSound.play(0, 0, new SoundTransform(soundVolume));
			removeChild(pillarGraphics);
			pillarGraphics = new Bitmap(Assets.getBitmapData("assets/img/Background/Wall/Fixed" + frame+".png"));
			addChild(pillarGraphics);
			frame++;
			Timer.delay(crumble, 300);
		}
	}
	
}