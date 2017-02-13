package sprites.fruit.product;

import flixel.FlxSprite;

class GrapeSprite extends FruitSprite
{
	public function new(X:Float, Y:Float)
	{
			super(X, Y);
			loadGraphic(AssetPaths.grape__png, true, 32, 32);
	}
}
