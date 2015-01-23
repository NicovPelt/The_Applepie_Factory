package;


import haxe.Timer;
import openfl.display.Sprite;


class Main extends Sprite {
	
	var game:Game;
	public function new () {
		
		super ();

		game = new Game();
		addChild(game);
		update();
		
	}
	
	function update()
	{
		game.update();
		Timer.delay(update, 50);
		game.rotation += 1;
	}
	
}