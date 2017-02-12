package sprites.fruit;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class AppleSprite extends FruitSprite
{

	public function new(X:Float, Y:Float)
	{
			super(X, Y);
			// makeGraphic(32, 32, 0xFFC1604D);
			loadGraphic(AssetPaths.apple__png, true, 32, 32);
	}

  override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

}
