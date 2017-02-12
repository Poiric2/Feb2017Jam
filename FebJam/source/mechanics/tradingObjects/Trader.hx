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

	public var want(default,null):Array<Int>;

	public function new(num:Int)
	{
		super();
		var rand_fruit:Int;
		 want = new Array<Int>();
		for (i in 0...num) {
			// Sys.println("Doing: " + num);

			do
			{
				rand_fruit = random_.int(0,TraderObject.options_.length);
			} while(fruit_remaining_[rand_fruit] != 0 || TraderObject.options_[rand_fruit] == "Kiwi");

			// Sys.println("Chose: " + rand_fruit);
			// fruit_names_.push(rand_fruit);
			fruit_remaining_[rand_fruit] = cast (100/num);
		}

		for (i in 0...3)
		{
			do {
				rand_fruit = random_.int(0,TraderObject.options_.length-1);
			} while(want.indexOf(rand_fruit) != -1);

			want.push(rand_fruit);
		}
	}

	public function accept():Void
	{

	}

}
