package sprites.background;

import flixel.FlxSprite;

class TableSprite extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0)
	{
			super(X, Y);
			loadGraphic(AssetPaths.background__png, false, 800, 640);
	}
}
