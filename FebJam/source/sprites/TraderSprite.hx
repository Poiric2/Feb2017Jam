package sprites;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class TraderSprite extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0)
	{
			super(X, Y);
			// 0xFFA84E4E
			makeGraphic(128, 128, 0xFFA84E4E);
	}

  override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

}
