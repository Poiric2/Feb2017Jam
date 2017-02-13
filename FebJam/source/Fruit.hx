package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Fruit
{
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
}
