package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/fonts/Fonthead Standard EULA.txt", "assets/fonts/Fonthead Standard EULA.txt");
			type.set ("assets/fonts/Fonthead Standard EULA.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/fonts/GoodDog.otf", "assets/fonts/GoodDog.otf");
			type.set ("assets/fonts/GoodDog.otf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/images/backgrounds/background.png", "assets/images/backgrounds/background.png");
			type.set ("assets/images/backgrounds/background.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/backgrounds/credits.png", "assets/images/backgrounds/credits.png");
			type.set ("assets/images/backgrounds/credits.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/backgrounds/overlay.png", "assets/images/backgrounds/overlay.png");
			type.set ("assets/images/backgrounds/overlay.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/backgrounds/splash.png", "assets/images/backgrounds/splash.png");
			type.set ("assets/images/backgrounds/splash.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/fruits/apple.png", "assets/images/fruits/apple.png");
			type.set ("assets/images/fruits/apple.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/fruits/banana.png", "assets/images/fruits/banana.png");
			type.set ("assets/images/fruits/banana.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/fruits/coconut.png", "assets/images/fruits/coconut.png");
			type.set ("assets/images/fruits/coconut.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/fruits/grape.png", "assets/images/fruits/grape.png");
			type.set ("assets/images/fruits/grape.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/fruits/kiwi.png", "assets/images/fruits/kiwi.png");
			type.set ("assets/images/fruits/kiwi.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/fruits/pear.png", "assets/images/fruits/pear.png");
			type.set ("assets/images/fruits/pear.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/fruits/plum.png", "assets/images/fruits/plum.png");
			type.set ("assets/images/fruits/plum.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/fruits/watermelon.png", "assets/images/fruits/watermelon.png");
			type.set ("assets/images/fruits/watermelon.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/traders/trader1.png", "assets/images/traders/trader1.png");
			type.set ("assets/images/traders/trader1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/traders/trader2.png", "assets/images/traders/trader2.png");
			type.set ("assets/images/traders/trader2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/traders/trader3.png", "assets/images/traders/trader3.png");
			type.set ("assets/images/traders/trader3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/traders/trader4.png", "assets/images/traders/trader4.png");
			type.set ("assets/images/traders/trader4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/traders/trader5.png", "assets/images/traders/trader5.png");
			type.set ("assets/images/traders/trader5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/buttons/counter/down.png", "assets/images/ui/buttons/counter/down.png");
			type.set ("assets/images/ui/buttons/counter/down.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/buttons/counter/number.png", "assets/images/ui/buttons/counter/number.png");
			type.set ("assets/images/ui/buttons/counter/number.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/buttons/counter/up.png", "assets/images/ui/buttons/counter/up.png");
			type.set ("assets/images/ui/buttons/counter/up.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/buttons/splashButton.png", "assets/images/ui/buttons/splashButton.png");
			type.set ("assets/images/ui/buttons/splashButton.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/buttons/trade/accept.png", "assets/images/ui/buttons/trade/accept.png");
			type.set ("assets/images/ui/buttons/trade/accept.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/buttons/trade/reject.png", "assets/images/ui/buttons/trade/reject.png");
			type.set ("assets/images/ui/buttons/trade/reject.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/gui/bigCoin.png", "assets/images/ui/gui/bigCoin.png");
			type.set ("assets/images/ui/gui/bigCoin.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/gui/bottomFrame.png", "assets/images/ui/gui/bottomFrame.png");
			type.set ("assets/images/ui/gui/bottomFrame.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/gui/cloth.png", "assets/images/ui/gui/cloth.png");
			type.set ("assets/images/ui/gui/cloth.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/gui/scroll.png", "assets/images/ui/gui/scroll.png");
			type.set ("assets/images/ui/gui/scroll.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/gui/smallCoin.png", "assets/images/ui/gui/smallCoin.png");
			type.set ("assets/images/ui/gui/smallCoin.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ui/gui/woodFrame.png", "assets/images/ui/gui/woodFrame.png");
			type.set ("assets/images/ui/gui/woodFrame.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/home.ogg", "assets/music/home.ogg");
			type.set ("assets/music/home.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/introtheme.ogg", "assets/music/introtheme.ogg");
			type.set ("assets/music/introtheme.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
