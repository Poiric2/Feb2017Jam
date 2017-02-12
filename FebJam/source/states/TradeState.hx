package states;

import sprites.*;
import sprites.ui.*;
import sprites.fruit.*;
import mechanics.*;
import mechanics.tradingObjects.*;
import flixel.text.FlxText;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;

class TradeState extends FlxState
{
	private var _trader_sprite:Array<TraderSprite>;
	private var _table_sprite:TableSprite;

	private var _player:Player;
	private var _player_fruits:Array<FruitButton>;
	private var _traders:Array<Trader>;
	private var _trader_fruits:Array<FruitButton>;

	private var _counters_buttons:Array<Array<FlxButton>>;
	private var _counters:Array<CounterSprite>;

	private var _trade_sprite:TradeSprite;
	private var _scroll_sprite:ScrollSprite;

	private var _current:Int = 0;

	private var _accept:FlxButton;
	private var _decline:FlxButton;
	
	private var _overlay:OverlaySprite;
	private var _overlay_button:FlxButton;
	private var _overlay_header:FlxText;
	private var _overlay_text:FlxText;
	private var _next_text:FlxText;


  override public function create():Void
	{

		FlxG.sound.play(AssetPaths.home__ogg, 1, true);

		_table_sprite = new TableSprite(0,0);
		add(_table_sprite);

		_trader_sprite = new Array<TraderSprite>();
		for (i in 0...5)
		{
			_trader_sprite[i] = new TraderSprite(64,480,i);
		}
		_trade_sprite = new TradeSprite(64,464);
		add(_trade_sprite);

		_player = new Player();
		_player_fruits = new Array<FruitButton>();

		_traders = new Array<Trader>();
		_trader_fruits = new Array<FruitButton>();

		for (i in 0...20) {
			_traders[i] = new Trader(5);
		}

		// renderTraderObject(16,_traders[_current].fruit_names_,_trader_fruits);
		renderTraderObject(752,_player.fruit_remaining_,_player_fruits,1);

		_counters_buttons       = new Array<Array<FlxButton>>();
		_counters_buttons[0]    = new Array<FlxButton>();
		_counters_buttons[1]    = new Array<FlxButton>();

		_counters = new Array<CounterSprite>();
		initTrader();

		_scroll_sprite = new ScrollSprite(608, 470);
		add(_scroll_sprite);

		// createScroller(50,192,0,_traders[_current]);
		createScroller(706,192,1,_player);

		_accept = new FlxButton(330,441,"",accept);
		_decline = new FlxButton(426,441,"",decline);

		_accept.loadGraphic(AssetPaths.accept__png,64,32);
		_decline.loadGraphic(AssetPaths.reject__png,64,32);

		//add(_accept);
		//add(_decline);
		
		// initial overlay stuff
		_overlay = new OverlaySprite(0, 0);
		add(_overlay);
		
		_overlay_header = new FlxText(140, 144, 520, "The market is opening!");
		_overlay_header.setFormat("assets/fonts/GoodDog.otf", 64, 0xFF573A30, CENTER);
		add(_overlay_header);
		
		_overlay_text = new FlxText(200, 224, 400, "Trade your Kiwis for other kinds of fruit  to make the most money.");
		_overlay_text.setFormat("assets/fonts/GoodDog.otf", 45, 0xFF573A30, CENTER);
		add(_overlay_text);
		
		_overlay_button = new FlxButton(222, 420, "", nextOverlay);
		_overlay_button.loadGraphic(AssetPaths.splashButton__png);
		add(_overlay_button);
		
		_next_text = new FlxText(200, 445, 400, "Start");
		_next_text.setFormat("assets/fonts/GoodDog.otf", 45, 0xFF573A30, CENTER);
		add(_next_text);

		super.create();
  }

  override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	private function renderTraderObject(loc:Int,amounts:Array<Int>,fruits:Array<FruitButton>,index:Int) {
		// Sys.println("Doing: " + labels.toString());
		var delta:Int = 64;

		delta += cast (384-Lambda.filter(amounts, function(i) { return (i!=0); }).length*32)/2;

		// Sys.println("At: " + delta);
		var j:Int = 0;
		for (i in 0...amounts.length) {
			// var type:String = TraderObject.options_[i];
			if (amounts[i] > 0)
			{
				switch i
				{
					case 0:
						fruits[j] = new AppleButton(loc,delta,"",function():Void {Sys.println("Apple Pressed");});
					case 1:
						fruits[j] = new BananaButton(loc,delta,"",function():Void {Sys.println("Banana Pressed");});
					case 2:
						fruits[j] = new CoconutButton(loc,delta,"",function():Void {Sys.println("Coconut Pressed");});
					case 3:
						fruits[j] = new GrapeButton(loc,delta,"",function():Void {Sys.println("Grape Pressed");});
					case 4:
						fruits[j] = new KiwiButton(loc,delta,"",function():Void {Sys.println("Kiwi Pressed");});
					case 5:
						fruits[j] = new PearButton(loc,delta,"",function():Void {Sys.println("Pear Pressed");});
					case 6:
						fruits[j] = new PlumButton(loc,delta,"",function():Void {Sys.println("Plum Pressed");});
					case 7:
						fruits[j] = new WatermelonButton(loc,delta,"",function():Void {Sys.println("Watermelon Pressed");});
				}


				add(fruits[j]);
				delta += 32;
				j += 1;
			}

		}
	}

	private function destroyTraderObject():Void
	{
		var item:FruitButton;

		// for (i in 0..._trader)
		// Sys.println(_trader_fruits.length);
		do {
			item = _trader_fruits.pop();
			// Sys.println(item);
			// Sys.println(_trader_fruits.length);
			remove(item);
			if (item != null) { remove(item); item.destroy; }

		} while( _trader_fruits.length > 0 );
	}

	private function createScroller(x:Int,y:Int,index:Int,trader:TraderObject):Void
	{
		_counters[index] = new CounterSprite(x,y+32);
		add(_counters[index]);
		add(_counters[index].text);

		// var func_up:Void->Void = function():Void {_counters[index].setValue(_counters[index].getValue()+1);};
		_counters_buttons[index][0] = new FlxButton(x,y,"",function():Void
																											 {
																												 var newValue:Int = _counters[index].getValue()+1;

																												 if (newValue >= 0 && newValue <=10)
																												 	 _counters[index].setValue(newValue);
																											 });
		_counters_buttons[index][1] = new FlxButton(x,y+96,"",function():Void
																											 {
																												 var newValue:Int = _counters[index].getValue()-1;

																												 if (newValue >= 0 && newValue <=10)
																												 	 _counters[index].setValue(newValue);
																											 });

		_counters_buttons[index][0].loadGraphic(AssetPaths.up__png);
		_counters_buttons[index][1].loadGraphic(AssetPaths.down__png);

		add(_counters_buttons[index][0]);
		add(_counters_buttons[index][1]);
	}

	private function destroyScroller(index:Int)
	{
		remove(_counters[index].text);
		remove(_counters[index]);
		_counters[index].destroy();

		// _counters[index] = null;

		remove(_counters_buttons[index][0]);
		_counters_buttons[index][0].destroy();
		// _counters_buttons[index][0] = null;
		remove(_counters_buttons[index][1]);
		_counters_buttons[index][1].destroy();


		// _counters_buttons[index][1] = null;
	}

	private function accept():Void
	{
		next();
	}
	private function decline():Void
	{
		next();
	}

	private function next():Void
	{
		destroyTrader();
		_current += 1;

		if (_current < 20)
		{
			initTrader();
			update(0);
		}
		else endDay();
	}

	private function destroyTrader():Void
	{
		destroyTraderObject();
		destroyScroller(0);
	}

	private function initTrader():Void
	{
		// _trader_fruits = new Array<FruitButton>();
		renderTraderObject(16,_traders[_current].fruit_remaining_,_trader_fruits,0);
		createScroller(50,192,0,_traders[_current]);
	}
	
	private function endDay():Void
	{
		_player.addFunds(5);
		_overlay = new OverlaySprite();
		add(_overlay);
		
		_accept.destroy();
		_decline.destroy();
		
		if (Reg.level == 4) {
			_overlay_header = new FlxText(140, 144, 520, "The market is closed!");
			_overlay_text = new FlxText(200, 224, 400, "Wow, you made " + Reg.score + " in only 5 days. See if you can do even better next time!");
			_next_text = new FlxText(200, 445, 400, "End Game");
		} else {
			_overlay_header = new FlxText(140, 144, 520, "The market is closing!");
			_overlay_text = new FlxText(200, 224, 400, "You head home to sell off your extra stock. Tomorrow is a new day.");
			_next_text = new FlxText(200, 445, 400, "Next Day");
		}
		
		_overlay_header.setFormat("assets/fonts/GoodDog.otf", 64, 0xFF573A30, CENTER);
		add(_overlay_header);
		
		_overlay_text.setFormat("assets/fonts/GoodDog.otf", 45, 0xFF573A30, CENTER);
		add(_overlay_text);
		
		_overlay_button = new FlxButton(222, 420, "", nextDay);
		_overlay_button.loadGraphic(AssetPaths.splashButton__png);
		add(_overlay_button);
		
		_next_text.setFormat("assets/fonts/GoodDog.otf", 45, 0xFF573A30, CENTER);
		add(_next_text);
	}
	
	private function nextOverlay():Void
	{
		_overlay.destroy();
		_overlay_header.destroy();
		_overlay_text.destroy();
		_overlay_button.destroy();
		_next_text.destroy();
		
		add(_accept);
		add(_decline);
	}
	
	private function nextDay():Void
	{
		if (Reg.level == 4) {
			FlxG.switchState(new StartState());
		} else {
			++Reg.level;
			FlxG.switchState(new TradeState());
		}
	}
}
