package mechanics.tradingObjects;

import flixel.FlxBasic;
import flixel.text.FlxText;

class Player extends TraderObject
{
	public var _coin_count_(default,null):FlxText;

	public function new(coin_x:Int, coin_y:Int)
	{
		// Call super first because we need to use parent code
		super();

		// Start with a hundred Kiwis and no money
		_fruit_remaining_[4] = 100;
		_money_ = 0;

		_coin_count_ = new FlxText(coin_x, coin_y, 200, ""+_money_);
		_coin_count_.setFormat("assets/fonts/GoodDog.otf", 45, 0xFF573A30, RIGHT);

	}

	override public function addFunds(new_funds:Int):Void
	{
		super.addFunds(new_funds);
		_coin_count_.text = "" + _money_;
	}

	override public function destroy():Void
	{
		_coin_count_.destroy();
		super.destroy();
	}

}
