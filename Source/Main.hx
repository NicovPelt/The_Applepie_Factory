package;


import haxe.Timer;
import openfl.display.Sprite;


class Main extends Sprite {
	
	var game:Game;
	var music = new Music();
	public function new () {
		
		super ();
		
		game = new Game();
		addChild(game);
		addChild(music);
		update();
		music.playGameMusic(1.0);
	}
	
	function update()
	{
		game.update();
		Timer.delay(update, 30);
	}
	
}