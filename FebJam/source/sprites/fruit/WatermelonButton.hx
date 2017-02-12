package sprites.fruit;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class WatermelonButton extends FruitButton
{

	public function new(X:Float, Y:Float, text:String, func:Void->Void)
	{
			super(X, Y,text,func);
			// makeGraphic(32, 32, 0xFF1E6C6B);
			loadGraphic(AssetPaths.watermelon__png, true, 32, 32);
	}

  override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

}