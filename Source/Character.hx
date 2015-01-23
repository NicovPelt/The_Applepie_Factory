package ;

import openfl.display.Sprite;
import openfl.display.Tilesheet;
import openfl.geom.Rectangle;
import openfl.events.Event;
import openfl.Assets;

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
	
	
	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
		
	}
	
	function init(e:Event) {
		initTiles();
		drawCharacter();
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