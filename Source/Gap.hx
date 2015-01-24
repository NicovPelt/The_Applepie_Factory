package ;
import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author steffansk1997
 */
class Gap extends Sprite
{	
	public var isFilled = false;
	
	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	function init(e:Event) {
		
	}
	
}