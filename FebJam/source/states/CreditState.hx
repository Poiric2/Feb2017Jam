package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

import sprites.ui.*;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class CreditState extends FlxState
{
	/**
	 * Back button stuff
	 */
	private var back_button_:FlxButton;
	private var back:FlxText;
	private var back_ground:CreditsSprite;
	
	/**
	 * Credit texts
	 */
	private var credit1:FlxText;
	private var credit2:FlxText;
	private var credit3:FlxText;
	 
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		back_ground = new CreditsSprite(0,0);
		add(back_ground);
		
		back_button_ = new FlxButton(222, 530, "", backToMenu);
		back_button_.loadGraphic(AssetPaths.splashButton__png);
		add(back_button_);
		
		back = new FlxText(333,555,120,"Back");
		back.setFormat("assets/fonts/GoodDog.otf", 45, 0xFF573A30, CENTER);
		add(back);
		
		credit1 = new FlxText(160, 224, 400, "Erie - Home");
		credit1.setFormat("assets/fonts/GoodDog.otf", 45, 0xFF573A30, LEFT);
		add(credit1);
		
		credit2 = new FlxText(160, 270, 400, "Adn adn - Intro Theme");
		credit2.setFormat("assets/fonts/GoodDog.otf", 45, 0xFF573A30, LEFT);
		add(credit2);
		
		credit3 = new FlxText(160, 318, 400, "Marcelofg55 - Town Music");
		credit3.setFormat("assets/fonts/GoodDog.otf", 45, 0xFF573A30, LEFT);
		/** add(credit3); */
		
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
	
	private function backToMenu():Void
	{
		FlxG.switchState(new StartState());
	}
}
