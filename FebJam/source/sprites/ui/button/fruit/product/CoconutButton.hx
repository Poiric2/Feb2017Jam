package sprites.ui.button.fruit.product;

class CoconutButton extends FruitButton
{
	public function new(X:Float, Y:Float, text:String, func:Void->Void)
	{
			super(X, Y,text,func);
			loadGraphic(AssetPaths.coconut__png, true, 32, 32);
	}

	override public function create(X:Float, Y:Float,text:String,func:Void->Void):CoconutButton { return new CoconutButton(X,Y,text,func); }
}
