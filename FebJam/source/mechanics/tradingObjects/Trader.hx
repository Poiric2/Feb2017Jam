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
			var rand_fruit:String;

			do
			{
				rand_fruit = random_.getObject(TraderObject.options_);
			} while(fruit_names_.indexOf(rand_fruit) != -1);

			// Sys.println("Chose: " + rand_fruit);
			fruit_names_.push(rand_fruit);
			fruit_remaining_.push(random_.int(0,cast (100/num+.5))+5);
		}
	}

}
