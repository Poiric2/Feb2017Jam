package sprites.background;

import flixel.FlxSprite;

class CreditsSprite extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0)
	{
			super(X, Y);
			loadGraphic(AssetPaths.credits__png, false, 800, 640);
	}
}
