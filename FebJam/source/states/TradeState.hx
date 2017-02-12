package states;

import sprites.*;
import flixel.FlxSprite;
import sprites.ui.*;
import sprites.fruit.*;
import mechanics.*;
import mechanics.tradingObjects.*;
import flixel.text.FlxText;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;

import flixel.math.FlxRandom;

class TradeState extends FlxState
{
	private var _trader_sprite:Array<TraderSprite>;
	private var _table_sprite:TableSprite;

	private var _player:Player;
	private var _fruits:Array<Array<FruitButton>>;
	private var _traders:Array<Trader>;
	private var _trader_fruits:Array<FruitButton>;

	private var _trade_fruits:Array<Array<Array<FruitSprite>>>;

	private var _counters_buttons:Array<Array<FlxButton>>;
	private var _counters:Array<CounterSprite>;

	private var _trade_sprite:TradeSprite;
	private var _scroll_sprite:ScrollSprite;

	private var _current:Int = 0;
	private var _current_trader:Int = 0;
	private var _selected:Array<Int> = [-1, -1];

	private var _accept:FlxButton;
	private var _decline:FlxButton;
	
	private var _overlay:OverlaySprite;
	private var _overlay_button:FlxButton;
	private var _overlay_header:FlxText;
	private var _overlay_text:FlxText;
	private var _next_text:FlxText;
	
	private var _top_coin:FlxSprite;
	private var _coin_count:FlxText;
	private var _top_kiwi:FlxSprite;
	private var _kiwi_count:FlxText;

	private var _want:Array<FruitSprite>;

	private var _want_text:FlxText;

  override public function create():Void
	{

		_want_text = new FlxText(640, 470,96,"Want");
		_want_text.setFormat("assets/fonts/GoodDog.otf", 28, 0xFFFFFFFF, CENTER);

		_want = new Array<FruitSprite>();

		FlxG.sound.play(AssetPaths.home__ogg, 1, true);

		_table_sprite = new TableSprite(0,0);
		add(_table_sprite);

		_trader_sprite = new Array<TraderSprite>();
		for (i in 0...5)
		{
			_trader_sprite[i] = new TraderSprite(92,493,i);
		}
		_trade_sprite = new TradeSprite(64,464);

		_trade_fruits = new Array<Array<Array<FruitSprite>>>();

		for (i in 0...2)
		{
			_trade_fruits[i] = new Array<Array<FruitSprite>>();
			for (j in 0...TraderObject.options_.length)
				_trade_fruits[i][j] = new Array<FruitSprite>();
		}

		_player = new Player();

		_traders = new Array<Trader>();

		_fruits = new Array<Array<FruitButton>>();
		_fruits[0] = new Array<FruitButton>();
		_fruits[1] = new Array<FruitButton>();


		for (i in 0...20) {
			_traders[i] = new Trader(Reg.level + 1);
		}

		// renderTraderObject(16,_traders[_current].fruit_names_,_trader_fruits);
		renderTraderObject(752,_player.fruit_remaining_,1);

		_counters_buttons       = new Array<Array<FlxButton>>();
		_counters_buttons[0]    = new Array<FlxButton>();
		_counters_buttons[1]    = new Array<FlxButton>();

		_counters = new Array<CounterSprite>();
		_scroll_sprite = new ScrollSprite(608, 470);
		initTrader();

		// createScroller(50,192,0,_traders[_current]);
		createScroller(706, 192, 1, _player);
		
		_top_coin = new FlxSprite(400, 10, AssetPaths.smallCoin__png);
		add(_top_coin);
		_coin_count = new FlxText(200, -5, 200, "0");
		_coin_count.setFormat("assets/fonts/GoodDog.otf", 45, 0xFF573A30, RIGHT);
		add(_coin_count);
		
		
		_top_kiwi = new FlxSprite(600,5);
		_top_kiwi.loadGraphic(AssetPaths.kiwi__png, true, 32, 32);
		add(_top_kiwi);
		_kiwi_count = new FlxText(400, -5, 200, "" + _player.fruit_remaining_[4]);
		_kiwi_count.setFormat("assets/fonts/GoodDog.otf", 45, 0xFF573A30, RIGHT);
		add(_kiwi_count);

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
		
		_overlay_text = new FlxText(200, 224, 400, "Trade your Kiwis for other kinds of fruit to make the most money.");
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

	private function renderTraderObject(loc:Int,amounts:Array<Int>,index:Int) {
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
						_fruits[index][j] = new AppleButton(loc,delta,"",function():Void {_selected[index] = 0; _counters[index].setValue(_trade_fruits[index][_selected[index]].length);});
					case 1:
						_fruits[index][j] = new BananaButton(loc,delta,"",function():Void {_selected[index] = 1; _counters[index].setValue(_trade_fruits[index][_selected[index]].length);});
					case 2:
						_fruits[index][j] = new CoconutButton(loc,delta,"",function():Void {_selected[index] = 2; _counters[index].setValue(_trade_fruits[index][_selected[index]].length);});
					case 3:
						_fruits[index][j] = new GrapeButton(loc,delta,"",function():Void {_selected[index] = 3; _counters[index].setValue(_trade_fruits[index][_selected[index]].length);});
					case 4:
						_fruits[index][j] = new KiwiButton(loc,delta,"",function():Void {_selected[index] = 4; _counters[index].setValue(_trade_fruits[index][_selected[index]].length);});
					case 5:
						_fruits[index][j] = new PearButton(loc,delta,"",function():Void {_selected[index] = 5; _counters[index].setValue(_trade_fruits[index][_selected[index]].length);});
					case 6:
						_fruits[index][j] = new PlumButton(loc,delta,"",function():Void {_selected[index] = 6; _counters[index].setValue(_trade_fruits[index][_selected[index]].length);});
					case 7:
						_fruits[index][j] = new WatermelonButton(loc,delta,"",function():Void {_selected[index] = 7; _counters[index].setValue(_trade_fruits[index][_selected[index]].length);});
				}

				add(_fruits[index][j]);
				delta += 32;
				j += 1;
			}

		}

		var x:Int = 670;
		var y:Int = 500;

		for (i in 0..._traders[_current].want.length)
		{
			var item:FruitSprite = null;
			switch _traders[_current].want[i]
			{
				case 0:
					item = new AppleSprite(x,y);
				case 1:
					item = new BananaSprite(x,y);
				case 2:
					item = new CoconutSprite(x,y);
				case 3:
					item = new GrapeSprite(x,y);
				case 4:
					item = new KiwiSprite(x,y);
				case 5:
					item = new PearSprite(x,y);
				case 6:
					item = new PlumSprite(x,y);
				case 7:
					item = new WatermelonSprite(x,y);
			}
			_want.push(item);
			add(item);
			y += 32;
		}
	}

	private function destroyTraderObject(index:Int):Void
	{
		var item:FruitButton;

		// for (i in 0..._trader)
		// Sys.println(_fruits[index].length);
		do {
			item = _fruits[index].pop();
			// Sys.println(item);
			// Sys.println(_fruits[index].length);
			remove(item);
			if (item != null) { remove(item); item.destroy; }

		} while( _fruits[index].length > 0 );

		for (i in 0..._want.length)
		{
			var item:FruitSprite = _want.pop();
			remove(item);
			item.destroy();
		}
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

																												 var chosen:Int = _selected[index];

																												 if (chosen != -1 && newValue >= 0 && newValue <=10)
																												 {
																												 	 _counters[index].setValue(newValue);
																													 createFruit(index,_selected[index],Lambda.filter(trader.fruit_remaining_, function(i) { return (i!=0); }).length);
																												 }
																											 });
		_counters_buttons[index][1] = new FlxButton(x,y+96,"",function():Void
																											 {
																												 var newValue:Int = _counters[index].getValue()-1;

																												 var chosen:Int = _selected[index];

																												 if (chosen != -1 && newValue >= 0 && newValue <=10)
																												 {
																												 	 _counters[index].setValue(newValue);
																													 deleteFruit(index,_selected[index]);
																												 }
																											 });

		_counters_buttons[index][0].loadGraphic(AssetPaths.up__png);
		_counters_buttons[index][1].loadGraphic(AssetPaths.down__png);

		add(_counters_buttons[index][0]);
		add(_counters_buttons[index][1]);
	}

	private function destroyScroller(index:Int)
	{
		remove(_counters[index].text);
		// _counters[index].setValue(0);
		_counters[index].text.destroy();
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
		_traders[_current].accept();
		for (i in 0...2)
		{
			for (j in 0..._trade_fruits[i].length)
			{
				 if (i == 0 && _trade_fruits[i][j].length > 0) _player.addFunds(TraderObject.prices_[j]*_trade_fruits[i][j].length) /*_player.trade(j,_trade_fruits[i][j].length);*/
				 else if (_trade_fruits[i][j].length > 0)  _player.trade(j,-_trade_fruits[i][j].length);
			}
		}
		destroyScroller(1);
		createScroller(706,192,1,_player);

		var item:FruitButton;

		// for (i in 0..._trader)
		// Sys.println(_fruits[index].length);
		do {
			item = _fruits[1].pop();
			// Sys.println(item);
			// Sys.println(_fruits[1].length);
			remove(item);
			if (item != null) { remove(item); item.destroy; }

		} while( _fruits[1].length > 0 );

		renderTraderObject(752, _player.fruit_remaining_, 1);
		
		_coin_count.destroy();
		_coin_count = new FlxText(200, -5, 200, "" + _player.getFunds());
		_coin_count.setFormat("assets/fonts/GoodDog.otf", 45, 0xFF573A30, RIGHT);
		add(_coin_count);

		_kiwi_count.destroy();
		_kiwi_count = new FlxText(400, -5, 200, "" + _player.fruit_remaining_[4]);
		_kiwi_count.setFormat("assets/fonts/GoodDog.otf", 45, 0xFF573A30, RIGHT);
		add(_kiwi_count);
		
		next();
	}
	private function decline():Void
	{
		_counters[1].setValue(0);
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
		for (i in 0...2)
		{
			for(j in 0...8)
			{
				for(k in 0..._trade_fruits[i][j].length)
				{
					var item:FruitSprite = _trade_fruits[i][j].pop();
					remove(item);
					item.destroy();
				}
			}
		}

		remove(_trader_sprite[_current_trader]);
		remove(_trade_sprite);
		remove(_scroll_sprite);
		remove(_want_text);

		_selected[0] = -1;
		_selected[1] = -1;

		destroyTraderObject(0);
		destroyScroller(0);
	}

	private function initTrader():Void
	{
		// _trader_fruits = new Array<FruitButton>();
		var random_:FlxRandom = new FlxRandom();
		_current_trader = random_.int(0,4);
		add(_trader_sprite[_current_trader]);
		add(_trade_sprite);
		add(_scroll_sprite);
		add(_want_text);
		renderTraderObject(16,_traders[_current].fruit_remaining_,0);
		createScroller(50,192,0,_traders[_current]);
	}
	
	private function endDay():Void
	{
		_player.addFunds(5);
		_overlay = new OverlaySprite();
		add(_overlay);
		
		_accept.destroy();
		_decline.destroy();
		
		Reg.score += _player.getFunds();
		_player.resetFunds();
		
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

	private function createFruit(index:Int,which:Int,howMany:Int):Void{
		var x:Int = 96;
		var y:Int = 64;

		var iter:Int = 0;
		var count:Int = 0;
		var array:Array<Int> = null;

		if (index == 0) array = _traders[_current].fruit_remaining_;
		else    				array = _player.fruit_remaining_;
		while (iter < which)
		{
			if (array[iter] != 0) count += 1;
			iter += 1;
		}

		y += Std.int((384 - (Std.int(howMany/2)+howMany%2)*64)/2);

		x += if (howMany%2 != 0 && count == 0) 122 else (48 +(count+howMany%2)%2 *120);

		// x += if (count%2 != howMany%2) ((count+howMany%2)%2)*100 else 0;
		// Sys.println(count);
		y += (Std.int((count+howMany%2)/2))*70;
		//
		// // Sys.println(_trade_fruits[index][which]);
		x += (_trade_fruits[index][which].length%5)*16;

		y += Std.int(_trade_fruits[index][which].length/5)*16;

		x += index * 300;

		var item:FruitSprite = null;

		switch which
		{
			case 0:
				item = new AppleSprite(x,y);
			case 1:
				item = new BananaSprite(x,y);
			case 2:
				item = new CoconutSprite(x,y);
			case 3:
				item = new GrapeSprite(x,y);
			case 4:
				item = new KiwiSprite(x,y);
			case 5:
				item = new PearSprite(x,y);
			case 6:
				item = new PlumSprite(x,y);
			case 7:
				item = new WatermelonSprite(x,y);
		}

		_trade_fruits[index][which].push(item);
		add(_trade_fruits[index][which][_trade_fruits[index][which].length-1]);
	}

	private function deleteFruit(index:Int,which:Int):Void{
		var item:FruitSprite = _trade_fruits[index][which].pop();

		remove(item);
		item.destroy();
	}

}
