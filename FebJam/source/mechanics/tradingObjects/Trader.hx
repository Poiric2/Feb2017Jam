package mechanics.tradingObjects;

import flixel.FlxBasic;
import flixel.math.FlxRandom;

/**
 * ...
 * @author Claira
 */
class Trader extends TraderObject
{
	private var money_:Int;
	private static var random_:FlxRandom = new FlxRandom();

	public function new(num:Int)
	{
		super();

		for (i in 0...num) {
			// Sys.println("Doing: " + num);
			var rand_fruit:Int;

			do
			{
				rand_fruit = random_.int(0,TraderObject.options_.length);
			} while(fruit_remaining_[rand_fruit] != 0);

			// Sys.println("Chose: " + rand_fruit);
			// fruit_names_.push(rand_fruit);
			fruit_remaining_[rand_fruit] = cast (100/num);
		}
	}

}
