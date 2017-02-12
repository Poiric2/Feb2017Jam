package mechanics.tradingObjects;

import flixel.FlxBasic;

/**
 * ...
 * @author Claira
 */
class TraderObject extends FlxBasic
{
	public var fruit_remaining_(default, null):Array<Int>;

	public static var options_(default, null):Array<String> = ["Apple","Banana","Coconut","Grape","Kiwi","Pear","Plum","Watermelon"];

	public function new()
	{
		fruit_remaining_ = new Array<Int>();

		for (i in 0...TraderObject.options_.length)
			fruit_remaining_[i] = 0;
		super();
	}

	public function trade(name:String, fruit_traded:Int):Bool
	{
		var index = TraderObject.options_.indexOf(name);

		if (fruit_traded <= fruit_remaining_[index]) {
			fruit_remaining_[index] -= fruit_traded;
			return true;
		}

		return false;
	}

	public function howMany(name:String):Int
	{
		var how_many_ = TraderObject.options_.indexOf(name);

		return fruit_remaining_[how_many_];
	}
}
