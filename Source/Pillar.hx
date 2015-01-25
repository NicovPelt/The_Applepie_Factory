package ;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.Event;

/**
 * ...
 * @author ...
 */
class Pillar extends Sprite
{
	var rock:GrabbableObject;
	var pillarGraphics:Bitmap = new Bitmap(Assets.getBitmapData("assets/img/Background/Wall/Fixed1.png"));
	public var destroyed:Bool = false;

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
		if (this.hitTestObject(rock)) {
			
		}
	}
	
}