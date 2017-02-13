package sprites.ui.button.fruit.product;

class AppleButton extends FruitButton
{
	public function new(X:Float,Y:Float,text:String,func:Void->Void)
	{
			super(X,Y,text,func);
			loadGraphic(AssetPaths.apple__png, true, 32, 32);
	}

	override public function create(X:Float, Y:Float,text:String,func:Void->Void):AppleButton { return new AppleButton(X,Y,text,func); }
}
