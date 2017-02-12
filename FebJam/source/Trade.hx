package;

import flixel.FlxBasic;
import flixel.util.FlxRandom;

/**
 * ...
 * @author ...
 */
class Trade extends FlxBasic
{
	private var trader_name_:String;
	private var trader_num_fruit_types_:Int;
	private var trader_fruit_names_:Array<String>;
	private var trader_fruit_vals_:Array<Int>;
	private var trader_fruits_offered_:Array<Int>;
	
	private var player_fruit_val_:Int;
	private var player_fruits_offered_:Int;
	
	private var all_names_:Array<String> = ["Nick", "Claira", "Michael"];

	public function new() 
	{
		player_fruit_val_ = 0;
		player_fruits_offered_ = 0;
		
		trader_name_ = new String(all_names_[FlxRandom.intRanged(0, all_names_.length - 1)]);
		trader_num_fruit_types_ = FlxRandom.intRanged(1, 3);
		trader_fruit_names_ = new Array<String>();
		trader_fruit_vals_ = new Array<Int>();
		
		for (i in 0...trader_num_fruit_types)
		{
			trader_fruit_names_.push("Pineapple");
			trader_fruit_vals_.push(FlxRandom.intRanged(1, 3));
			trader_fruits_offered_.push(0);
			
			player_fruit_val_ += FlxRandom.intRanged(2, 4);
		}
		
		super();
		
	}
	
	public function getTraderName():String
	{
		return trader_name_;
	}
}