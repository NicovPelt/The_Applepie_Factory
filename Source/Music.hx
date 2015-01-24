package;

import flash.display.Sprite;
import flash.events.Event;
import haxe.Timer;
import flash.Lib;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.Assets.loadSound;


/**
 * ...
 * @author Andor
 */
class Music extends Sprite 
{

	var GameBGM1 = Assets.getSound("audio/GGJ_Maintheme.mp3");
	
	var musicVolume: Float;
	var soundChannel:SoundChannel;
	
	public function new() 
	{
		super();
		
	}
	
	public function playGameMusic (input:Float)
	
	{
		this.musicVolume = input ;
		soundChannel = GameBGM1.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, gameMusicRepeat );
		
		
	}
	
	function gameMusicRepeat (event:Event)
	{
		soundChannel = GameBGM1.play();
		soundChannel.soundTransform = new SoundTransform(musicVolume);
		soundChannel.addEventListener(Event.SOUND_COMPLETE, gameMusicRepeat );
		
	}
}