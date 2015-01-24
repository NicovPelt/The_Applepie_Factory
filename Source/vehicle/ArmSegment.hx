package vehicle ;
import openfl.display.Sprite;

/**
 * ...
 * @author Matthijs van Gelder
 */
class ArmSegment extends Sprite
{

	public function new() 
	{
		super();
		draw();
	}
	
	function draw()
	{
		graphics.beginFill(0x000000);
		graphics.drawCircle(0, 0, 20);
		graphics.drawRect( 0, -10, 200, 20);
		graphics.endFill();
	}
}