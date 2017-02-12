package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class StartState extends FlxState
{
	/**
	 * Variables
	 */
	private var playButton_:FlxButton;
	private var creditButton_:FlxButton;

	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		playButton_ = new FlxButton(380, 300, "Play", playGame);
		creditButton_ = new FlxButton(380, 320, "Credits", viewCredits);

		add(playButton_);
		add(creditButton_);

		super.create();
	}

	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	/**
	 * Functions to change the game states
	 */
	private function playGame():Void
	{
		FlxG.switchState(new TradeState());
	}

	private function viewCredits():Void
	{
		FlxG.switchState(new CreditState());
	}
}
