package;


import haxe.Timer;
import openfl.display.Sprite;
import menu.Menu;


class Main extends Sprite {
	
	var game:Game;
	var music = new Music();
	var started:Bool = false;
	var menu:menu.Menu;
	public function new () {
		
		super ();
		
		menu = new menu.Menu();
		addChild(menu);
		addChild(music);
		update();
		music.playGameMusic(1.0);
	}
	
	function update()
	{
		if (!started) {
			if(menu.start == true){
				removeChild(menu);
				game = new Game();
				addChild(game);
				started = true;
			}
		}else{
			game.update();
		}
		Timer.delay(update, 30);
	}
	
}