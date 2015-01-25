package ;

import openfl.display.Sprite;
import openfl.Assets;
import haxe.Timer;
import openfl.display.Bitmap;
import openfl.events.Event;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import openfl.Assets.loadSound;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;

/**
 * ...
 * @author ...
 */
class Cutscene extends Sprite
{

	var bangSound = Assets.getSound("audio/GGJ_bang.wav");
	var errorSound = Assets.getSound("audio/GGJ_error.wav");
	var rockSound = Assets.getSound("audio/GGJ_rock.wav");
	var switchSound = Assets.getSound("audio/GGJ_switch_1.wav");
	var toneSound = Assets.getSound("audio/GGJ_tone.wav");
	
	
	var soundVolume: Float = 4;
	var soundChannel:SoundChannel;
	
	public var frameNr:Int = 0;
	var main:Main;
	var skip:Bool = false;
	
	public function new(main:Main) 
	{
		super();
		this.main = main;
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	function init(e:Event) {
		nextFrame();
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
	}
	
	function nextFrame() {
		removeChildren();
		if (frameNr == 4 || frameNr == 7) soundChannel = toneSound.play(0, 0, new SoundTransform(soundVolume));
		if (frameNr == 10) soundChannel = bangSound.play(0, 0, new SoundTransform(soundVolume));
		var frame:Bitmap = new Bitmap(Assets.getBitmapData("img/cutscene/cutscene" + frameNr + ".png"));
		frame.width = stage.stageWidth;
		frame.height = stage.stageHeight;
		addChild(frame);
		frameNr++;
		if(frameNr<21 && !skip){
			Timer.delay(nextFrame, 500);
		} else {
			Timer.delay(done, 500);
		}
	}
	function done() {
		main.startGame();
	}
	
	function onKeyDown(event:KeyboardEvent) {
		stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		skip = true;
	}
	
}