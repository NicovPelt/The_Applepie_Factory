package ;
import openfl.display.Sprite;
import vehicle.Vehicle;

/**
 * ...
 * @author ...
 */
class Game extends Sprite
{

	public function new() 
	{
		super();
		var terrain = new Terrain();
		addChild(terrain);
		var vehicle = new Vehicle(Std.int(stage.stageWidth/2), Std.int(stage.stageHeight/2));
		addChild(vehicle);
	}
	
}