package sprites.ui.gui;

import flixel.FlxSprite;

class TradeSprite extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0)
	{
			super(X, Y);
			loadGraphic(AssetPaths.bottomFrame__png, false, 800, 640);
	}
}
