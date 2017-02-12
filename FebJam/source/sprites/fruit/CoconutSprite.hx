package sprites.fruit;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class CoconutSprite extends FruitSprite
{

	public function new(?X:Float=0, ?Y:Float=0)
	{
			super(X, Y);
			makeGraphic(32, 32, 0xFFE9DBCC);
	}

  override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

}
