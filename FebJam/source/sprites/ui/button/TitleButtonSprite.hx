package sprites.ui.button;

import flixel.FlxSprite;

class TitleButtonSprite extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0)
	{
			super(X, Y);
			loadGraphic(AssetPaths.splashButton__png, false, 338, 117);
	}
}
