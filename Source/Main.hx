package;


import haxe.Timer;
import menu.Button;
import openfl.display.Sprite;
import menu.Menu;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import openfl.events.MouseEvent;
import openfl.display.StageDisplayState;
import openfl.Lib;


class Main extends Sprite {
	
	var game:Game;
	var music = new Music();
	var started:Bool = false;
	var startMenu:menu.Menu = new Menu(1);
	var pauseMenu:Menu = new Menu(2);
	var pauseButton:Button = new Button("img/MainMenu/pause.png", "img/MainMenu/pause.png");
	
	
	
	public function new () {
		super ();
		game = new Game();
		goFullScreen();
		addChild(startMenu);
		addChild(music);
		update();
		music.playGameMusic(1.0);

	}
	
	function update()
	{	
		goFullScreen();
		if (!started) {
			if (startMenu.start) {
				started = true;
				startMenu.start = false;
				removeChild(startMenu);
				addChild(new Cutscene(this));
			}else if (pauseMenu.start) {
				pauseMenu.start = false;
				started = true;
				addChild(game);
				addChild(pauseButton);
				stage.addEventListener(KeyboardEvent.KEY_DOWN, pauseKey);
				pauseButton.addEventListener(MouseEvent.CLICK, pauseClick);
			}
		}else{
			game.update();
		}
		Timer.delay(update, 30);
	}
	
	function pauseKey(e:KeyboardEvent) {
		if (e.keyCode == Keyboard.ESCAPE) {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, pauseKey);
			pause();
		}
	}
	function pauseClick(e:MouseEvent) {
		pauseButton.removeEventListener(MouseEvent.CLICK, pauseClick);
		pause();
	}
	function pause() {
		goFullScreen();
		started = false;
		addChild(pauseMenu);
		removeChild(game);
		removeChild(pauseButton);
		
	}
	function goFullScreen() {
		if(Lib.current.stage.displayState != StageDisplayState.FULL_SCREEN_INTERACTIVE){
			Lib.current.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		}
	}
	
	public function startGame() {
		removeChildren();
		addChild(game);
		started = true;
		pauseButton.x = 15;
		pauseButton.y = 15;
		addChild(pauseButton);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, pauseKey);
		pauseButton.addEventListener(MouseEvent.CLICK, pauseClick);
	}
}