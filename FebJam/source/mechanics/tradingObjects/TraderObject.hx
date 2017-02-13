package mechanics.tradingObjects;

/******************************************************************************/
/*                                  IMPORTS                                   */
/******************************************************************************/

import flixel.FlxBasic;
import flixel.math.FlxRandom;

/******************************************************************************/
/*                                TRADEROBJECT                                */
/******************************************************************************/

class TraderObject extends FlxBasic
{
	// Every TraderObject has a number for the remaining fruits they have for each
	// Fruit that is implemented in the game
	// Every TraderObject has their own amount of money and a psuedo random number generator
	public var _fruit_remaining_(default,null):Array<Int> = null;

	private var _money_:Int;
	private var _random_:FlxRandom = new FlxRandom();

	/****************************************************************************/
	/*     These variables exist for all TraderObjects and there is only one    */
	/*                        in existance At all times                         */
	/****************************************************************************/

	// This contains all of the fruits that exist in the game
	// This is immutable as the game will not need to change this
	// This implicitly holds the ID's as the indices
	public static var _options_(default, null):Array<String> = ["Apple",
																													    "Banana",
																													    "Coconut",
																													    "Grape",
																													    "Kiwi",
																													    "Pear",
																													    "Plum",
																													    "Watermelon"];
	// This contains all of the prices of the fruits
	// Everything has access to this but this can be changed every day with the
	// updatePrices function
	public static var _prices_(default, null):Array<Int> = [0,
																													0,
																													0,
																													0,
																													0,
																													0,
																													0,
																													0];

	/****************************************************************************/
	/*                                CONSTRUCTOR                               */
	/****************************************************************************/

	public function new()
	{
		// Allocate memory for the TraderObject so that they can use it
		_fruit_remaining_ = new Array<Int>();

		// Now default all the currently held fruits to nothing
		_fruit_remaining_ = [for (i in 0...TraderObject._options_.length) 0];

		// Call super for FlxBasic functionality
		super();
	}

	/****************************************************************************/
	/*                                 ACCESSORS                                */
	/****************************************************************************/

	// Takes a fruit name as a String and returns how many of it is left
	// If the fruit does not exist return -1
	public function howManybyName(name:String):Int
	{
		var how_many = TraderObject._options_.indexOf(name);
		if (how_many == -1) return -1;
		return _fruit_remaining_[how_many];
	}

	// Takes a fruit ID as an Int and returns how many of it is left
	// If the fruit ID is invalid return -1
	public function howManybyID(ID:Int):Int
	{
		if (ID < 0 || ID >= _fruit_remaining_.length) return -1;
		return _fruit_remaining_[ID];
	}

	// Get the amount of money of the TraderObject
	public function getFunds():Int { return _money_; }

	// Checks if we can trade
	public function canTrade(ID:Int,how_many:Int):Bool
	{
		var value:Int = _fruit_remaining_[ID] + how_many;

		// Checks if the id is valid
		if (ID < 0 || ID >= _fruit_remaining_.length || value < 0) return false;

		_fruit_remaining_[ID] = value;
		return true;
	}

	/****************************************************************************/
	/*                                 MODIFIERS                                */
	/****************************************************************************/

	public function addFunds(new_funds:Int):Void { _money_ += new_funds; }
	public function resetFunds()					 :Void { _money_ = 0; }

	// Takes a fruit ID and makes sure we can trade
	public function trade(ID:Int,how_many:Int):Bool
	{
		if (canTrade(ID,how_many))
		{
			_fruit_remaining_[ID] += how_many;
			return true;
		}
		return false;
	}
}
