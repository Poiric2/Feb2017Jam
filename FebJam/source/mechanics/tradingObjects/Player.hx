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
		fruit_names_[0]     = "Kiwi";
		fruit_remaining_[0] = 100;
		for (i in 0...7)
			fruit_remaining_[i] = 100;
		money_ = 0;
	}


	public function addFunds(newFunds:Int):Void
	{
	money_ += newFunds;
	}

}
