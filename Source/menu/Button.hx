package menu ;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.MouseEvent;
import openfl.media.Sound;

/**
 * ...
 * @author steffansk1997
 */
class Button extends Sprite
{
	var mainImage:Bitmap;
	var mainImageHover:Bitmap;
	public function new(image:String, imageHover:String) 
	{
		super();
		mainImage = new Bitmap(Assets.getBitmapData(image));
		mainImageHover = new Bitmap(Assets.getBitmapData(imageHover));
		draw();
		addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
		addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
	}
	function draw() {
		addChild(mainImage);
	}
	function onMouseOver(e:MouseEvent) {
		removeChildren();
		addChild(mainImageHover);
	}
	function onMouseOut(e:MouseEvent) {
		removeChildren();
		addChild(mainImage);
	}
	
}