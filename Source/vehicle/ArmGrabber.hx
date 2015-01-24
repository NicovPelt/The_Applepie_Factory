package vehicle ;
import openfl.display.Sprite;
import openfl.geom.Point;


/**
 * ...
 * @author Matthijs van Gelder
 */
class ArmGrabber extends Sprite
{
	var grabbing:Bool = false;
	var grabbed:GrabbableObject;
	public function new() 
	{
		super();
		draw();
	}
	
	function draw()
	{
		graphics.beginFill(0x000022);
		graphics.drawCircle(0, 0, 20);
		graphics.drawRect( 0, -10, 80, 20);
		graphics.endFill();
	}
	
	public function grabObject(object:GrabbableObject)
	{
		if (this.hitTestObject(object))
		{
			grabbed = object;
			grabbing = true;
			addChild(grabbed);
			grabbed.x = 50;
			grabbed.y = 0;
		}
		this.
	}
	
	public function dropObject()
	{
		
	}
	
	public function update()
	{
		/*
		if (grabbed != null)
		{
			var point:Point = new Point(this.x, this.y);
			var targetPoint:Point = new Point();
			targetPoint = localToGlobal(point);
			grabbed.x = targetPoint.x - 120;
			grabbed.y = targetPoint.y;
		}*/
	}
}