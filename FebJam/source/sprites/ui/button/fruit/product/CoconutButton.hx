package sprites.ui.button.fruit.product;

import flixel.FlxSprite;

class CoconutButton extends FruitButton
{
	public function new(X:Float, Y:Float, text:String, func:Void->Void)
	{
			super(X, Y,text,func);
			loadGraphic(AssetPaths.coconut__png, true, 32, 32);
	}
}
