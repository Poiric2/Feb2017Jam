package sprites.ui;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class ScrollSprite extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0)
	{
			super(X, Y);
			// makeGraphic(608, 384, 0xFFB28142);
			loadGraphic(AssetPaths.scroll__png, false, 169, 153);
			// loadGraphic(AssetPaths.bottomFrame__png, false, 800, 640);
	}

  override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
