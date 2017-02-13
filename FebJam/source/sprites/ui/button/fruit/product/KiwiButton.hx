package sprites.ui.button.fruit.product;

class KiwiButton extends FruitButton
{
	public function new(X:Float, Y:Float, text:String, func:Void->Void)
	{
			super(X, Y,text,func);
			loadGraphic(AssetPaths.kiwi__png, true, 32, 32);
	}

	override public function create(X:Float, Y:Float,text:String,func:Void->Void):KiwiButton { return new KiwiButton(X,Y,text,func); }
}
