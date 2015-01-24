package vehicle ;
import openfl.display.Sprite;
import openfl.geom.Point;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.Assets;

/**
 * ...
 * @author Matthijs van Gelder
 */
class ArmGrabber extends Sprite
{
	var grabbing:Bool = false;
	var grabbed:GrabbableObject;
	public var grabbableObjects:Array<GrabbableObject> = new Array<GrabbableObject>();
	public var terrain:Terrain;
	
	public function new() 
	{
		super();
		draw();
	}
	
	function draw()
	{
		var bitmapData:BitmapData = Assets.getBitmapData("assets/img/Gripper1.png");
		var bitmap = new Bitmap(bitmapData);
		bitmap.y = -50;
		bitmap.x = -12;
		addChild(bitmap);
		var bitmapData2:BitmapData = Assets.getBitmapData("assets/img/Gripper2.png");
		var bitmap2 = new Bitmap(bitmapData2);
		bitmap2.y = -50;
		bitmap2.x = -12;
		addChild(bitmap2);
		var bitmapData3:BitmapData = Assets.getBitmapData("assets/img/Gripper3.png");
		var bitmap3 = new Bitmap(bitmapData3);
		bitmap3.y = 50 - 15;
		bitmap3.x = -12;
		addChild(bitmap3);
		rotation += 90;
		
	}
	
	public function grabObject()
	{
		for(object in grabbableObjects){
			if (this.hitTestObject(object) && !grabbing)
			{
				grabbed = object;
				grabbing = true;
				addChild(grabbed);
				grabbed.x = 50;
				grabbed.y = 0;
				grabbed.rotation -= 90;
				grabbed.grabbed = true;
			}
		}
	}
	
	public function dropObject()
	{
		if(grabbing){
			grabbing = false;
			terrain.addObject(grabbed);
			var point = new Point(this.x, this.y);
			point = localToGlobal(point);
			point = terrain.globalToLocal(point);
			grabbed.x = point.x;
			grabbed.y = point.y;
			grabbed.rotation += 90;
			grabbed.grabbed = false;
			//grabbed = null;
			
		}
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