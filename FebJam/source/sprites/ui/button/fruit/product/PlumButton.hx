package sprites.ui.button.fruit.product;

class PlumButton extends FruitButton
{
	public function new(X:Float, Y:Float, text:String, func:Void->Void)
	{
			super(X, Y,text,func);
			loadGraphic(AssetPaths.plum__png, true, 32, 32);
	}

	override public function create(X:Float, Y:Float,text:String,func:Void->Void):PlumButton { return new PlumButton(X,Y,text,func); }
}
