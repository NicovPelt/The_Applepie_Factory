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
		this.graphics.drawRect( 0, 0, 50, 100);
		this.graphics.endFill();
		this.x = 2450;
		this.y = stage.stageHeight;
		this.alpha =0;
	}
	public function update() {
		if (this.hitTestObject(rock)) {
			isFilled = true;
			rock.inGap = true;
		}else {
			isFilled = false;
		}
	}
}