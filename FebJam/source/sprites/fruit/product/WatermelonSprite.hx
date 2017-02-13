package sprites.fruit.product;

class WatermelonSprite extends FruitSprite
{
	public function new(X:Float, Y:Float)
	{
			super(X, Y);
			loadGraphic(AssetPaths.watermelon__png, true, 32, 32);
	}

	override public function create(X:Float, Y:Float):WatermelonSprite { return new WatermelonSprite(X,Y); }
}
