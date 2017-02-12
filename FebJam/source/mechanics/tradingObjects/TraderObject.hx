package mechanics.tradingObjects;

import flixel.FlxBasic;

/**
 * ...
 * @author Claira
 */
class TraderObject extends FlxBasic
{
	public var fruit_names_(default, null):Array<String>;
	public var fruit_remaining_(default, null):Array<Int>;

	public static var options_(default, null):Array<String> = ["Apple","Banana","Coconut","Grape","Kiwi","Peach","Pear","Pineapple","Plum","Watermelon"];

	public function new()
	{
		fruit_names_ = new Array<String>();
		fruit_remaining_ = new Array<Int>();
		super();
	}

	public function trade(name:String, fruit_traded:Int):Bool
	{
		var index = fruit_names_.indexOf(name);

		if (index != -1 && fruit_traded <= fruit_remaining_[index]) {
			fruit_remaining_[index] -= fruit_traded;
			return true;
		}

		return false;
	}

	public function howMany(name:String):Int
	{
		var how_many_ = fruit_names_.indexOf(name);

		if (how_many_ == -1) return 0;

		return fruit_remaining_[how_many_];
	}
}
