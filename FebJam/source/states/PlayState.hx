
package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var player_:Player;

	private var current_trade_:Trade;
	private var current_day_:Int;
	private var trades_left_:Int;
	private var traders_left:Int;
	
	private var overlay:OverlaySprite;

	private var overlay:OverlaySprite;

	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		current_trade_ = new Trade();
		current_day_ = 1;
		trades_left_ = 10;
		traders_left = 20;

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

	private function makeTrade():Void
	{
		player_.trade(current_trade_.profit(), current_trade_.getPlayerFruitsOffered());
		--traders_left;
		--trades_left_;
		current_trade_.destroy();
		if (trades_left_ != 0 && traders_left != 0)
		{
			current_trade_ = new Trade();
		}
	}

	private function rejectTrade():Void
	{
		--traders_left;
		--trades_left_;
		current_trade_.destroy();
		if (trades_left_ != 0 && traders_left != 0) {
			current_trade_ = new Trade();
		}
	}

}
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		current_trade_ = new Trade();
		current_day_ = 1;
		trades_left_ = 10;
		traders_left = 20;

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

	private function makeTrade():Void
	{
		player_.trade(current_trade_.profit(), current_trade_.getPlayerFruitsOffered());
		--traders_left;
		--trades_left_;
		current_trade_.destroy();
		if (trades_left_ != 0 && traders_left != 0)
		{
			current_trade_ = new Trade();
		}
	}

	private function rejectTrade():Void
	{
		--traders_left;
		--trades_left_;
		current_trade_.destroy();
		if (trades_left_ != 0 && traders_left != 0) {
			current_trade_ = new Trade();
		}
	}

}
