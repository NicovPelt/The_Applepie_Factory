package ;
import openfl.display.Sprite;
import vehicle.ArmSegment;
import vehicle.Vehicle;
import openfl.Assets;
import openfl.events.Event;

/**
 * ...
 * @author ...
 */
class Game extends Sprite
{
	var character:Character;
	var vehicle:Vehicle;
	var terrain:Terrain;
	var rock:GrabbableObject = new GrabbableObject();
	var inited:Bool;
	
	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	//Called when the Game Class is added to the stage by the main class
	function init(e:Event) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		terrain = new Terrain();
		addChild(terrain);
		terrain.scaleX = terrain.scaleY = 2;
		vehicle = new Vehicle(Std.int(stage.stageWidth/2), Std.int(stage.stageHeight/2), terrain);
		addChild(vehicle);
		character = new Character(1, vehicle);
		
		addChild(character);
		inited = true;
		addChild(rock);
		rock.x = 1000;
		rock.y = 500;
	}
	
	public function update()
	{
		if (inited)
		{
		terrain.update();
		vehicle.update();
		vehicle.armGrabber.grabObject(rock);
		character.update();
		}
	}
}