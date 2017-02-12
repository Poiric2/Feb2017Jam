package mechanics.tradingObjects;

import flixel.FlxBasic;

/**
 * ...
 * @author Claira
 */
class Player extends TraderObject
{
	private var money_:Int;

	public function new()
	{
		super();
		fruit_remaining_[4] = 100;
		money_ = 0;
	}
	
	public function addFunds(newFunds:Int):Void
	{
	money_ += newFunds;
	}

	public function trade(item:Int,howMany:Int):Void
	{
		fruit_remaining_[item] += howMany;
	}
	
	public function getFunds():Int
	{
		return money_;
	}
	
	public function resetFunds():Void
	{
		money_ = 0;
	}
}
