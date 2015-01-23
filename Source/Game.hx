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
	var character:Character = new Character;
	var vehicle:Vehicle = new Vehicle;

	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init)
	}
	
	//Called when the Game Class is added to the stage by the main class
	function init(e:Event) 
	{
		var terrain = new Terrain();
		addChild(terrain);
		var vehicle = new Vehicle(Std.int(stage.stageWidth/2), Std.int(stage.stageHeight/2));
		addChild(vehicle);
	}
}