package states;

import sprites.*;
import flixel.FlxState;
import flixel.ui.FlxButton;

class TradeState extends FlxState
{
	private var _trader:TraderSprite;
	private var _table:TableSprite;

	private var _leftUp:FlxButton;
	private var _leftDown:FlxButton;
	// private var _leftCounter:CounterSprite;

	private var _rightUp:FlxButton;
	private var _rightDown:FlxButton;
	// private var _rightCounter:CounterSprite;


  override public function create():Void
	{
		_trader = new TraderSprite(64,480);
		add(_trader);
		_table = new TableSprite(96,64);
		add(_table);
		createScroller(56,192,_leftUp,_leftDown);
		// createScroller(712,192,_leftUp,_leftDown,_leftCounter);
		super.create();
  }

  override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	private function createScroller(x:Int,y:Int,up:FlxButton,down:FlxButton):Void
	{
		up = new FlxButton(0, 0, "Label", myCallback);


		add(up);
		// add(down);
		// add(counter);
	}

	private function myCallback():Void
	{

	}

}
