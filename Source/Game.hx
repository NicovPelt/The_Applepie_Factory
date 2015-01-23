package ;
import openfl.display.Sprite;
import vehicle.Vehicle;
import openfl.Assets;
import openfl.events.Event;

/**
 * ...
 * @author ...
 */
class Game extends Sprite
{
	var character:Character = new Character();
	var vehicle:Vehicle;
	var terrain:Terrain;
	var inited:Bool = false;
	
	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	//Called when the Game Class is added to the stage by the main class
	function init(e:Event) 
	{
		terrain = new Terrain();
		addChild(terrain);
		vehicle = new Vehicle(Std.int(stage.stageWidth/2), Std.int(stage.stageHeight/2), terrain);
		addChild(vehicle);
		inited = true;
	}
	
	public function update()
	{
		if (inited)
		{
		terrain.update();	
		vehicle.update();
		}

	}
}