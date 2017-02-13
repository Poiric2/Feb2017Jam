package states;

import sprites.background.*;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.system.FlxSound;

import sprites.ui.*;
/**
 * A FlxState which can be used for the game's menu.
 */
class StartState extends FlxState
{
	/**
	 * Variables
	 */
	private var play_button_:FlxButton;
	private var credit_button_:FlxButton;
	private var quit_button_:FlxButton;
	private var play:FlxText;
	private var credit:FlxText;
	private var quit:FlxText;

	// private var sound:FlxSoundAsset;
	private var back_ground:TitleSprite;

	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{

		// sound = FlxG.sound.load(AssetPaths.introtheme__ogg);
		FlxG.sound.playMusic(AssetPaths.introtheme__ogg, 1, true);

		back_ground = new TitleSprite(0,0);
		add(back_ground);

		play_button_ = new FlxButton(64, 440, "", playGame);
		play = new FlxText(175,465,100,"Play");
		play.setFormat("assets/fonts/GoodDog.otf", 45, 0xFF573A30, CENTER);

		credit_button_ = new FlxButton(380, 440, "", viewCredits);
		credit = new FlxText(491,465,120,"Credits");
		credit.setFormat("assets/fonts/GoodDog.otf", 45, 0xFF573A30, CENTER);

		quit_button_ = new FlxButton(222, 530, "", stop);
		quit = new FlxText(333,555,120,"Quit");
		quit.setFormat("assets/fonts/GoodDog.otf", 45, 0xFF573A30, CENTER);

		play_button_.loadGraphic(AssetPaths.splashButton__png);
		credit_button_.loadGraphic(AssetPaths.splashButton__png);
		quit_button_.loadGraphic(AssetPaths.splashButton__png);

		add(play_button_);
		add(credit_button_);
		add(quit_button_);

		add(play);
		add(credit);
		add(quit);
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
		// FlxG.sound.music
		FlxG.sound.music.destroy();
		FlxG.switchState(new TradeState());
	}

	private function viewCredits():Void
	{
		FlxG.switchState(new CreditState());
	}

	private function stop():Void
	{
		Sys.exit(0);
	}
}
