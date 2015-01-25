package vehicle ;
import haxe.Timer;
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
	var bitmap2:Bitmap;
	var bitmap3:Bitmap;
	
	
	public function new() 
	{
		super();
		draw();
	}
	
	function draw()
	{
		var bitmapData:BitmapData = Assets.getBitmapData("assets/img/Gripper1_2X.png");
		var bitmap = new Bitmap(bitmapData);
		bitmap.y = -bitmap.height/2;
		bitmap.x = -bitmap.width/2;
		addChild(bitmap);
		var bitmapData2:BitmapData = Assets.getBitmapData("assets/img/Gripper2_2X.png");
		bitmap2 = new Bitmap(bitmapData2);
		bitmap2.y = -82;
		bitmap2.x = -25;
		addChild(bitmap2);
		var bitmapData3:BitmapData = Assets.getBitmapData("assets/img/Gripper3_2X.png");
		bitmap3 = new Bitmap(bitmapData3);
		bitmap3.y = 50;
		bitmap3.x = -25;
		addChild(bitmap3);
		rotation += 90;
		
	}
	
	public function grabObject()
	{
		bitmap2.y = -62;
		bitmap3.y = 30;
		Timer.delay(resetClaw, 500);
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
		bitmap2.rotation = -20;
		bitmap3.rotation = 20;
		Timer.delay(resetClaw, 500);
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
	
	function resetClaw()
	{
		bitmap2.y = -82;
		bitmap3.y = 50;
		bitmap2.rotation = 0;
		bitmap3.rotation = 0;
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