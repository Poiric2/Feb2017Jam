package sprites.ui.button.fruit.product;

class GrapeButton extends FruitButton
{
	public function new(X:Float, Y:Float, text:String, func:Void->Void)
	{
			super(X, Y,text,func);
			loadGraphic(AssetPaths.grape__png, true, 32, 32);
	}

	override public function create(X:Float, Y:Float,text:String,func:Void->Void):GrapeButton { return new GrapeButton(X,Y,text,func); }
}
