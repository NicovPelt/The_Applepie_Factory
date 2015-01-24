package ;
import openfl.display.Sprite;
import openfl.events.Event;
import vehicle.Vehicle;

class Gap extends Sprite
{	
	public var isFilled = false;
	var rock:GrabbableObject;
	
	public function new(rock:GrabbableObject) 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
		this.rock = rock;
		
	}
	
	function init(e:Event) {
		drawGap();
	}
	
	function drawGap() {

		this.graphics.beginFill(0xff0000);
		this.graphics.drawRect( 0, 0, 140, 150);
		this.graphics.endFill();
		this.x = 2360;
		this.y = stage.stageHeight - (this.height /2);
	}
	public function update() {
		if (this.hitTestObject(rock)) {
			isFilled = true;
		}else {
			isFilled = false;
		}
		trace(isFilled);
	}
}