package ;

import openfl.display.Sprite;
import openfl.display.Tilesheet;
import openfl.geom.Point;
import openfl.geom.Rectangle;
import openfl.events.Event;
import openfl.Assets;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import vehicle.Vehicle;

/**
 * ...
 * @author ...
 */
class Character extends Sprite
{
	var character:Tilesheet = new Tilesheet(Assets.getBitmapData("img/character/doofus.png"));
	
	var vehicle:Vehicle;
	
	var tileHeight:Int = 32;
	var tileWidth:Int = 32;
	var tiles:Int = 1;
	
	var keyJump:Int;
	var keyLeft:Int;
	var keyRight:Int;
	
	var isGrounded:Bool = false;
	var jumpSpeed:Int = 20;
	var acceleration:Int = 1;
	var verticleSpeed:Int = 0;
	var horizontalSpeed:Int = 3;
	
	public function new(charNo:Int, vehicle:Vehicle) 
	{
		super();
		
		this.vehicle = vehicle;
		
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
		addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
	}
	
	function init(e:Event) {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		initTiles();
		drawCharacter();
	}
	
	public function update() {
		this.x += horizontalSpeed;
		if (!isGrounded) {
			this.y += verticleSpeed;
			//TODO add horizontal movement
			
			verticleSpeed += acceleration;
		}
		for (platform in vehicle.platforms) {
			var point = new Point(platform.x, platform.y);
			point = vehicle.localToGlobal(point);
			if (!isGrounded) {
				if (hitTestObject(platform) && (this.y + this.height) > point.y && verticleSpeed > 0 && !(this.y + this.height > point.y + verticleSpeed)) {//bottom collision detect
					isGrounded = true;
					verticleSpeed = 0;
					this.y = point.y - this.height;
				} else if (hitTestObject(platform) && this.y < (point.y + platform.height) && verticleSpeed < 0){ //top collision detect
					this.y = point.y + platform.height + 2;
					verticleSpeed = 0;
				} 
			}
			if (hitTestObject(platform) && this.x < (point.x + platform.width) && horizontalSpeed < 0 && ((this.y > point.y && this.y < point.y + platform.height) || (this.y + this.height > point.y && this.y + this.height < point.y + platform.height))) {//left collision detect
				horizontalSpeed = 0;
				this.x = point.x + platform.width;
			} else if (hitTestObject(platform) && (this.x + this.width) > point.x && horizontalSpeed > 0 && ((this.y > point.y && this.y < point.y + platform.height) || (this.y + this.height > point.y && this.y + this.height < point.y + platform.height))) {//right collision detect
				horizontalSpeed = 0;
				this.x = point.x - this.width;
			
			}
		}
		if (isGrounded) {
			isGrounded = false;
		}
		
	}
	
	function keyDown(event:KeyboardEvent) {
		if (event.keyCode == keyJump && isGrounded) {
			verticleSpeed -= jumpSpeed;
		} else if (event.keyCode == keyLeft) {
			horizontalSpeed = -2;
			addEventListener(KeyboardEvent.KEY_UP, keyUp);
		} else if (event.keyCode == keyRight) {
			horizontalSpeed = 2;
			addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
	}
	
	function keyUp(event:KeyboardEvent) {
		if (event.keyCode == keyLeft || event.keyCode == keyRight) {
			horizontalSpeed = 0;
			removeEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
	}
	
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
			row = Math.floor( i / 3 );
			column = i % 3;
		}
	}
}