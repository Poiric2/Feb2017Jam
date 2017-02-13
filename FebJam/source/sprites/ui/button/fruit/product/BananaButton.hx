package sprites.ui.button.fruit.product;

class BananaButton extends FruitButton
{
	public function new(X:Float, Y:Float, text:String, func:Void->Void)
	{
			super(X, Y,text,func);
			loadGraphic(AssetPaths.banana__png, true, 32, 32);
	}

	override public function create(X:Float, Y:Float,text:String,func:Void->Void):BananaButton { return new BananaButton(X,Y,text,func); }
}
