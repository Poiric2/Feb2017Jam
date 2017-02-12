package sprites;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.ui.FlxButton;

class FruitButton extends FlxButton
{

	public function new(X:Float, Y:Float, text:String, func:Void->Void)
	{
			super(X, Y,text,func);
	}

  override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

}
