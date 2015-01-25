package ;

import openfl.display.Sprite;
import openfl.Assets;
import haxe.Timer;
import openfl.display.Bitmap;
import openfl.events.Event;

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
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	function init(e:Event) {
		nextFrame();
	}
	
	function nextFrame() {
		removeChildren();
		var frame:Bitmap = new Bitmap(Assets.getBitmapData("img/cutscene/cutscene" + frameNr + ".png"));
		frame.width = stage.stageWidth;
		frame.height = stage.stageHeight;
		addChild(frame);
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