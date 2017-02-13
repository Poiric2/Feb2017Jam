package sprites.ui.button.fruit.product;

class PearButton extends FruitButton
{
	public function new(X:Float, Y:Float, text:String, func:Void->Void)
	{
			super(X, Y,text,func);
			loadGraphic(AssetPaths.pear__png, true, 32, 32);
	}

	override public function create(X:Float, Y:Float,text:String,func:Void->Void):PearButton { return new PearButton(X,Y,text,func); }
}
