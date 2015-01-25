package menu ;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.Event;
import flash.system.System;
import openfl.events.MouseEvent;
/**
 * ...
 * @author steffansk1997
 */
class Menu extends Sprite
{
	public var start:Bool = false;
	var startButton:Button;
	var exitButton:Button = new Button("img/MainMenu/exit.png", "img/MainMenu/exit.png");
	var background:Bitmap = new Bitmap(Assets.getBitmapData("img/MainMenu/bg.png"));
	
	public function new(menu:Int) 
	{
		
		super();
		if (menu == 1) {
			startButton = new Button("img/MainMenu/start.png", "img/MainMenu/start.png");
		}else if(menu == 2){
			startButton = new Button("img/MainMenu/resume.png", "img/MainMenu/resume.png");
		}
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	function init(e:Event) {
		draw();
	}
	function draw() {
		background.width = stage.stageWidth;
		background.height = stage.stageHeight;
		addChild(background);
		
		startButton.x = Math.round((stage.stageWidth - startButton.width) / 2);
		startButton.y = Math.round((stage.stageHeight - startButton.height) / 2) - 30;
		addChild(startButton);
		startButton.addEventListener(MouseEvent.CLICK, starter);
		
		exitButton.x = Math.round((stage.stageWidth - exitButton.width) / 2);
		exitButton.y = Math.round((stage.stageHeight - exitButton.height) / 2) + 30;
		addChild(exitButton);
		exitButton.addEventListener(MouseEvent.CLICK, exit);
	}
	function starter(e:MouseEvent) {
		start = true;
	}
	
	function exit(e:MouseEvent) {
		System.exit(0);
	}
}