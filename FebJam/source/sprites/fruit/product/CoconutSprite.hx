package sprites.fruit.product;

import flixel.FlxSprite;

class CoconutSprite extends FruitSprite
{
	public function new(X:Float, Y:Float)
	{
			super(X, Y);
			loadGraphic(AssetPaths.coconut__png, true, 32, 32);
	}
}
