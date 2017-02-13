package sprites.fruit.product;

import flixel.FlxSprite;

class PlumSprite extends FruitSprite
{
	public function new(X:Float, Y:Float)
	{
			super(X, Y);
			loadGraphic(AssetPaths.plum__png, true, 32, 32);
	}
}
