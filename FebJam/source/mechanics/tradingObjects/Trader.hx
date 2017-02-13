package mechanics.tradingObjects;

import flixel.FlxBasic;
// import flixel.Math;

class Trader extends TraderObject
{

	public var _want_(default,null):Array<Int>;

	public function new(num:Int)
	{
		// Call super first because we need to use parent code
		super();

		// Trader has Infinite money
		_money_ = cast (Math.POSITIVE_INFINITY);
		var rand_fruit:Int;
		_want_ = new Array<Int>();
		for (i in 0...num) {

			do
			{
				rand_fruit = _random_.int(0,Fruit._options_.length);
			} while(_fruit_remaining_[rand_fruit] != 0 || Fruit._options_[rand_fruit] == "Kiwi");

			_fruit_remaining_[rand_fruit] = cast (100/num);
		}

		for (i in 0...3)
		{
			do {
				rand_fruit = _random_.int(0,Fruit._options_.length-1);
			} while(_want_.indexOf(rand_fruit) != -1);

			_want_.push(rand_fruit);
		}
	}

	public function accept():Void
	{

	}

}
