package sprites.fruit.product;

import flixel.FlxSprite;

class WatermelonSprite extends FruitSprite
{
	public function new(X:Float, Y:Float)
	{
			super(X, Y);
			loadGraphic(AssetPaths.watermelon__png, true, 32, 32);
	}
}
