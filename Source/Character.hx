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
	var character:Tilesheet = new Tilesheet(Assets.getBitmapData("img/character/doofusTiles.png"));
	var tileHeight:Int = 64;
	var tileWidth:Int = 64;
	var tiles:Int = 18;
	var	keys:Array<Bool> = new Array<Bool>();
	var keyJump:Int;
	var keyLeft:Int;
	var keyRight:Int;
	var xSpeed = 5;
	var ySpeed = 0;
	var yMaxSpeed = 15;
	var frame:Int = 0;
	var framesWalk:Int = 2;
	var framesJump:Int = 1;
	
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
		this.x = (stage.stageWidth - this.width) / 2;
		this.y = (stage.stageHeight - this.height) /2;
	}
	
	public function update() {
		move();
		this.width = 64;
		this.height = 64;
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
			animateRight();
		}else if(keys[keyLeft]) {
			this.x -= xSpeed;
			animateLeft();
			
		}else {
			drawCharacter();
			frame = 0;
		}
	}
	
	// Graphics Section
	function drawCharacter():Void {
		this.graphics.clear();
		character.drawTiles( this.graphics, [ 0, 0, 0], true );
	}
	function initTiles():Void {
		var column:Int = 0;
		var row:Int = 0;
		for( i in 0...(tiles) ){
			var charRect:Rectangle = new Rectangle( tileWidth * column, tileHeight * row, tileWidth, tileHeight );
			trace(column);
			character.addTileRect( charRect );
			if (column + 1 >= 3) {
				row++;
				column = 0;
			}else {
				column++;
			}
			
		}
	}
	function animateRight() {
		this.graphics.clear();
		if (frame % 3 != 1) { frame = 1; }
			if (frame + 3 < tiles) {
				frame += 3;
			}else {
				frame = 1;
			}
			trace (frame);
			character.drawTiles( this.graphics, [ 0, 0, frame], true );
		
	}
		function animateLeft() {
		this.graphics.clear();
		if (frame % 3 != 2) { frame = 2;}
			if (frame + 3 < tiles) {
				frame += 3;
			}else {
				frame = 2;
			}
			trace (frame);
			character.drawTiles( this.graphics, [ 0, 0, frame], true );
		
	}
}