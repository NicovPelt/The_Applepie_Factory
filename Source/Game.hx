package ;
import openfl.display.Sprite;
import openfl.media.Sound;
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
	public var character:Character;
	public var character2:Character;
	var vehicle:Vehicle;
	var terrain:Terrain;
	var rock:GrabbableObject = new GrabbableObject();
	var rock2:GrabbableObject = new GrabbableObject();
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
		terrain.scaleX = terrain.scaleY = 1;
		vehicle = new Vehicle(Std.int(stage.stageWidth/2), 720, terrain);
		addChild(vehicle);
		character = new Character(1, vehicle);
		var characters = new Array<Character>();
		addChild(character);
		characters.push(character);
		character2 = new Character(2, vehicle);
		addChild(character2);
		characters.push(character2);
		vehicle.characters = characters;
		
		inited = true;
		
		terrain.addChild(rock);
		terrain.addChild(rock2);
		vehicle.armGrabber.grabbableObjects.push(rock);
		vehicle.armGrabber.grabbableObjects.push(rock2);
		vehicle.armGrabber.terrain = terrain;
		rock.x = 1800;
		rock.y = 500;
		rock2.x = 3000;
		rock2.y = 500;
		var gap:Gap = new Gap(rock);
		terrain.addChild(gap);
		terrain.gaps.push(gap);
		var pillar:Pillar = new Pillar(rock2);
		terrain.pillar = pillar;
		terrain.addChild(pillar);
		
	}
	
	public function update()
	{
		if (inited)
		{
		terrain.update();
		vehicle.update();
		//vehicle.armGrabber.update();
		character2.update();
		character.update();
		rock.update();
		rock2.update();
		}
	}
}