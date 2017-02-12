package states;

import sprites.*;
import sprites.fruit.*;
import mechanics.*;
import mechanics.tradingObjects.*;
import flixel.text.FlxText;

import flixel.FlxState;
import flixel.ui.FlxButton;

class TradeState extends FlxState
{
	private var _trader_sprite:TraderSprite;
	private var _table_sprite:TableSprite;

	private var _player:Player;
	private var _player_fruits:Array<FruitSprite>;
	private var _traders:Array<Trader>;
	private var _trader_fruits:Array<FruitSprite>;

	private var _counters_buttons:Array<Array<FlxButton>>;
	private var _counters:Array<CounterSprite>;

	// private var _rightCounter:CounterSprite;

	private var _current:Int = 0;


  override public function create():Void
	{
		_trader_sprite = new TraderSprite(64,480);
		add(_trader_sprite);
		_table_sprite = new TableSprite(96,64);
		add(_table_sprite);

		_player = new Player();
		_player_fruits = new Array<FruitSprite>();

		_traders = new Array<Trader>();
		_trader_fruits = new Array<FruitSprite>();

		for (i in 0...20) {
			_traders[i] = new Trader(5);
		}

		renderTraderObject(16,_traders[_current].fruit_names_,_trader_fruits);
		renderTraderObject(752,_player.fruit_names_,_player_fruits);

		_counters_buttons       = new Array<Array<FlxButton>>();
		_counters_buttons[0]    = new Array<FlxButton>();
		_counters_buttons[1]    = new Array<FlxButton>();

		_counters = new Array<CounterSprite>();


		createScroller(56,192,0,_traders[_current]);
		createScroller(712,192,1,_player);
		super.create();
  }

  override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	private function renderTraderObject(loc:Int,labels:Array<String>,fruits:Array<FruitSprite>) {
		Sys.println("Doing: " + labels.toString());
		var delta:Int = 64;

		delta += cast (384-labels.length*32)/2;

		Sys.println("At: " + delta);
		for (i in 0...labels.length) {
			var type:String = labels[i];
			if (type == "Apple")
				fruits[i] = new AppleSprite(loc,delta);
			else if (type == "Banana")
				fruits[i] = new BananaSprite(loc,delta);
			else if (type == "Coconut")
				fruits[i] = new CoconutSprite(loc,delta);
			else if (type == "Grape")
				fruits[i] = new GrapeSprite(loc,delta);
			else if (type == "Kiwi")
				fruits[i] = new KiwiSprite(loc,delta);
			else if (type == "Peach")
				fruits[i] = new PeachSprite(loc,delta);
			else if (type == "Pear")
				fruits[i] = new PearSprite(loc,delta);
			else if (type == "Pineapple")
				fruits[i] = new PineappleSprite(loc,delta);
			else if (type == "Plum")
				fruits[i] = new PlumSprite(loc,delta);
			else if (type == "Watermelon")
				fruits[i] = new WatermelonSprite(loc,delta);

			add(fruits[i]);
			delta += 32;
		}
	}

	public function createScroller(x:Int,y:Int,index:Int,trader:TraderObject):Void
	{
		_counters[index] = new CounterSprite(x,y+32);
		add(_counters[index]);
		add(_counters[index].text);

		// var func_up:Void->Void = function():Void {_counters[index].setValue(_counters[index].getValue()+1);};
		_counters_buttons[index][0] = new FlxButton(x,y,"",function():Void {_counters[index].setValue(_counters[index].getValue()+1);});
		_counters_buttons[index][1] = new FlxButton(x,y+96,"",function():Void {_counters[index].setValue(_counters[index].getValue()-1);});
		add(_counters_buttons[index][0]);
		add(_counters_buttons[index][1]);
	}
}
