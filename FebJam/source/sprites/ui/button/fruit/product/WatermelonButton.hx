package sprites.ui.button.fruit.product;

class WatermelonButton extends FruitButton
{
	public function new(X:Float, Y:Float, text:String, func:Void->Void)
	{
			super(X, Y,text,func);
			loadGraphic(AssetPaths.watermelon__png, true, 32, 32);
	}

	override public function create(X:Float, Y:Float,text:String,func:Void->Void):WatermelonButton { return new WatermelonButton(X,Y,text,func); }
}
