package ;

import openfl.display.Sprite;
import openfl.Assets;
import haxe.Timer;
import openfl.display.Bitmap;

/**
 * ...
 * @author ...
 */
class Cutscene extends Sprite
{

	public var frameNr:Int = 0;
	var main:Main;
	
	public function new(main:Main) 
	{
		super();
		this.main = main;
		nextFrame();
	}
	
	function nextFrame() {
		removeChildren();
		addChild(new Bitmap(Assets.getBitmapData("img/cutscene/cutscene" + frameNr + ".png")));
		frameNr++;
		if(frameNr<21){
			Timer.delay(nextFrame, 500);
		} else {
			Timer.delay(done, 500);
		}
	}
	function done() {
		main.startGame();
	}
	
}