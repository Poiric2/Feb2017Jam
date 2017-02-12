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
		fruit_names_[0]     = "Pineapple";
		fruit_remaining_[0] = 100;
		money_ = 0;
	}

}
