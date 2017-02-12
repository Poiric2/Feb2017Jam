package sprites.ui;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class OverlaySprite extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0)
	{
			super(X, Y);
			// makeGraphic(608, 384, 0xFFB28142);
			loadGraphic(AssetPaths.overlay__png, false, 800, 640);
			// loadGraphic(AssetPaths.bottomFrame__png, false, 800, 640);
	}
<<<<<<< HEAD

=======
>>>>>>> 8e857b45e0399576a8ca658538d21a6d53004011
  override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
