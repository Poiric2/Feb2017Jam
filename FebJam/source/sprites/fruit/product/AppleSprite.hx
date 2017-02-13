package sprites.fruit.product;

import flixel.FlxSprite;

class AppleSprite extends FruitSprite
{
	public function new(X:Float, Y:Float)
	{
			super(X, Y);
			loadGraphic(AssetPaths.apple__png, true, 32, 32);
	}
}
