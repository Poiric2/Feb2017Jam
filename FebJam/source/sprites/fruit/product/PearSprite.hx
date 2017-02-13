package sprites.fruit.product;

import flixel.FlxSprite;

class PearSprite extends FruitSprite
{
	public function new(X:Float, Y:Float)
	{
			super(X, Y);
			loadGraphic(AssetPaths.pear__png, true, 32, 32);
	}
}
