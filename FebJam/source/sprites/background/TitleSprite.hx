package sprites.background;

import flixel.FlxSprite;

class TitleSprite extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0)
	{
			super(X, Y);
			loadGraphic(AssetPaths.splash__png, false, 800, 640);
	}
}
