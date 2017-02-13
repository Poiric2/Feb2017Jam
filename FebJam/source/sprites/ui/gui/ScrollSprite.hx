package sprites.ui.gui;

import flixel.FlxSprite;

class ScrollSprite extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0)
	{
			super(X, Y);
			loadGraphic(AssetPaths.scroll__png, false, 169, 153);
	}
}
