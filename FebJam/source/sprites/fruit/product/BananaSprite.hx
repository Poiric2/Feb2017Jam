package sprites.fruit.product;

import flixel.FlxSprite;

class BananaSprite extends FruitSprite
{
	public function new(X:Float, Y:Float)
	{
			super(X, Y);
			loadGraphic(AssetPaths.banana__png, true, 32, 32);
	}
}
