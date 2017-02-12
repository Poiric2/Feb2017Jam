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
		// fruit_names_[0]     = "Kiwi";
		fruit_remaining_[0] = 100;
		for (i in 0...7)
			fruit_remaining_[i] = 100;
=======
		fruit_remaining_[4] = 100;
>>>>>>> 5e795f4541f9d8bc62bc5593033c402b6eba0d64
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

}
