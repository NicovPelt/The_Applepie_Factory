package ;

import openfl.display.Sprite;
import openfl.display.Tilesheet;
import openfl.geom.Rectangle;
import openfl.events.Event;
import openfl.Assets;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;

/**
 * ...
 * @author ...
 */
class Character extends Sprite
{
	var character:Tilesheet = new Tilesheet(Assets.getBitmapData("img/character/doofus.png"));
	var tileHeight:Int = 32;
	var tileWidth:Int = 32;
	var tiles:Int = 1;
	var	keys:Array<Bool> = new Array<Bool>();
	var keyJump:Int;
	var keyLeft:Int;
	var keyRight:Int;
	var xSpeed = 10;
	var ySpeed = 0;
	var yMaxSpeed = 15;
	
	public function new(charNo:Int) 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
		if (charNo == 1) {
			keyJump = Keyboard.W;
			keyLeft = Keyboard.A;
			keyRight = Keyboard.D;
		}else if (charNo == 2) {
			keyJump = Keyboard.UP;
			keyLeft = Keyboard.LEFT;
			keyRight = Keyboard.RIGHT;
		}
		trace(keyJump);
		trace(keyRight);
		trace(keyLeft);
	}
	
	function init(e:Event) {
		initTiles();
		drawCharacter();
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
	}
	
	public function update() {
		move();
	}
	//Move Section	
	function onKeyDown(e:KeyboardEvent):Void {
		keys[e.keyCode] = true;
	}
	function onKeyUp(e:KeyboardEvent):Void {
		keys[e.keyCode] = false;
	}
	function move() {
		if (keys[keyRight]) {
			this.x += xSpeed;
		}else if(keys[keyLeft]) {
			this.x -= xSpeed;
		}
	}
	
	// Graphics Section
	function drawCharacter():Void {
		this.graphics.clear();
		character.drawTiles( this.graphics, [ 0, 0, 0], true );
		this.x = (stage.stageWidth - this.width) / 2;
		this.y = (stage.stageHeight - this.height) /2;
		
	}
	function initTiles():Void {
		var column:Int = 0;
		var row:Int = 0;
		for( i in 0...tiles ){
			var charRect:Rectangle = new Rectangle( tileWidth * column, tileHeight * row, tileWidth, tileHeight );
			character.addTileRect( charRect );
			row = Math.ceil( i / 3 );
			column = i % 3;
		}
	}
}