package sprites.fruit.product;

class CoconutSprite extends FruitSprite
{
	public function new(X:Float, Y:Float)
	{
			super(X, Y);
			loadGraphic(AssetPaths.coconut__png, true, 32, 32);
	}

	override public function create(X:Float, Y:Float):CoconutSprite { return new CoconutSprite(X,Y); }
}
