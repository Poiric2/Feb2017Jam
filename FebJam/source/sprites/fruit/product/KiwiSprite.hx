package sprites.fruit.product;

import flixel.FlxSprite;

class KiwiSprite extends FruitSprite
{
	public function new(X:Float, Y:Float)
	{
			super(X, Y);
			loadGraphic(AssetPaths.kiwi__png, true, 32, 32);
	}
}
