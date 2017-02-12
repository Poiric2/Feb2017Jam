package mechanics;

import flixel.FlxBasic;

/**
 * ...
 * @author Claira
 */
class Player extends FlxBasic
{
	private var money_:Int;
	private var fruit_remaining_:Int;

	public function new()
	{
		money_ = 0;
		fruit_remaining_ = 100;
		super();

	}

	public function trade(money_recieved:Int, fruit_traded:Int):Void
	{
		money_ += money_recieved;
		fruit_remaining_ -= fruit_traded;
	}

}
