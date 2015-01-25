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
	var vehicle:Vehicle;

	var character:Tilesheet;
	var tileHeight:Int = 64;
	var tileWidth:Int;
	var tiles:Int = 6;
	var	keys:Array<Bool> = new Array<Bool>();
	var keyJump:Int;
	var keyLeft:Int;
	var keyRight:Int;
	var xSpeed = 10;
	var frame:Int = 0;
	
	var isGrounded:Bool = false;
	var jumpSpeed:Int = 25;
	var acceleration:Int = 2;
	var verticleSpeed:Int = 0;
	var horizontalSpeed:Int = 0;
	var jumped:Bool = false;
	var char:Int;
	
	public var onButton:Bool = false;
	
	public function new(charNo:Int, vehicle:Vehicle) 
	{
		super();
		char = charNo;
		this.vehicle = vehicle;
		
		addEventListener(Event.ADDED_TO_STAGE, init);
		if (charNo == 1) {
			character = new Tilesheet(Assets.getBitmapData("img/character/doofusTiles.png"));
			keyJump = Keyboard.W;
			keyLeft = Keyboard.A;
			keyRight = Keyboard.D;
			tileWidth = 40;
		}else if (charNo == 2) {
			character = new Tilesheet(Assets.getBitmapData("img/character/dimwitTiles.png"));
			keyJump = Keyboard.UP;
			keyLeft = Keyboard.LEFT;
			keyRight = Keyboard.RIGHT;
			tileWidth = 40;
		}
	}
	
	function init(e:Event) {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		initTiles();
		drawCharacter();
		addKeyListeners();
		this.x = (stage.stageWidth - this.width) / 2 + 275 + (char-1) *64;
		this.y = (stage.stageHeight - this.height) /2;
	}
	public function addKeyListeners() {
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
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
			horizontalSpeed = xSpeed;
			animateRight();
		}else if(keys[keyLeft]) {
			horizontalSpeed = -xSpeed;
			animateLeft();
			
		}else if (jumped) {
			animateJump();
		}
		else {
			horizontalSpeed = 0;
			drawCharacter();
			frame = 0;
		}
		if (keys[keyJump] && isGrounded) {
			verticleSpeed -= jumpSpeed;
			isGrounded = false;
			jumped = true;
		}
		
	}
	
	public function update() {
		move();
		this.x += horizontalSpeed;
		isGrounded = false;
		if (!isGrounded) {
			this.y += verticleSpeed;			
			verticleSpeed += acceleration;
		}
		for (platform in vehicle.platforms) {
			var point = new Point(platform.x, platform.y);
			point = vehicle.localToGlobal(point);
			if (!isGrounded) {
				if (hitTestObject(platform) && (this.y + this.height) > point.y && verticleSpeed > 0 && !(this.y + this.height > point.y + verticleSpeed)) {//bottom collision detect
					isGrounded = true;
					jumped = false;
					verticleSpeed = 0;
					this.y = point.y - this.height;
				} else if (hitTestObject(platform) && this.y < (point.y + platform.height) && verticleSpeed < 0 && !(this.y < point.y + platform.height + verticleSpeed)){ //top collision detect
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
			character.addTileRect( charRect );
			if (column + 1 >= 4) {
				row++;
				column = 0;
			}else {
				column++;
			}
			
		}
	}
	var updatesPerFrame:Int = 5;
	var currentUpdate:Int = 0;
	function animateRight() {
		if (currentUpdate >= updatesPerFrame) {
			this.graphics.clear();
			if (frame % 4 != 1) { frame = 1; }
			if (frame + 4 < tiles) {
				frame += 4;
			}else {
				frame = 1;
			}
			character.drawTiles( this.graphics, [ 0, 0, frame], true );
			currentUpdate = 0;
		}else {
			currentUpdate++;
		}
	}
	function animateLeft() {
		if (currentUpdate >= updatesPerFrame) {
			this.graphics.clear();
			if (frame % 4 != 2) { frame = 2; }
			if (frame + 4 < tiles) {
				frame += 4;
			}else {
				frame = 2;
			}
			character.drawTiles( this.graphics, [ 0, 0, frame], true );
			currentUpdate = 0;
		}else {
			currentUpdate++;
		}
	}
	
	function animateJump() {
		if(currentUpdate >= updatesPerFrame){
		this.graphics.clear();
			if(!isGrounded){
			if (frame % 4 != 3) { frame = 3; }
				if (frame + 4 < tiles) {
					frame += 4;
				}else {
					frame = 3;
				}
				character.drawTiles( this.graphics, [ 0, 0, frame], true );
			}
			currentUpdate = 0;
		}else {
			currentUpdate++;
		}
	}
}