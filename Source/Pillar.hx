package ;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.Event;
import haxe.Timer;

/**
 * ...
 * @author ...
 */
class Pillar extends Sprite
{
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
			removeChild(pillarGraphics);
			pillarGraphics = new Bitmap(Assets.getBitmapData("assets/img/Background/Wall/Fixed" + frame+".png"));
			addChild(pillarGraphics);
			frame++;
			Timer.delay(crumble, 300);
		}
	}
	
}