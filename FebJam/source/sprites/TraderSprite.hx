package sprites;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class TraderSprite extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?which:Int)
	{
			super(X, Y);
			// 0xFFA84E4E
			// makeGraphic(128, 128, 0xFFA84E4E);
			switch which {
				case 0:
					loadGraphic(AssetPaths.trader1__png, false, 128, 128);
				case 1:
					loadGraphic(AssetPaths.trader2__png, false, 128, 128);
				case 2:
					loadGraphic(AssetPaths.trader3__png, false, 128, 128);
				case 3:
					loadGraphic(AssetPaths.trader4__png, false, 128, 128);
				case 4:
					loadGraphic(AssetPaths.trader5__png, false, 128, 128);
			}
	}

  override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

}
