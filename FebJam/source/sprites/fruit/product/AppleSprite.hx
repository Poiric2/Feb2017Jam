package sprites.fruit.product;

class AppleSprite extends FruitSprite
{
	public function new(X:Float, Y:Float)
	{
			super(X, Y);
			loadGraphic(AssetPaths.apple__png, true, 32, 32);
	}

	override public function create(X:Float, Y:Float):AppleSprite { return new AppleSprite(X,Y); }
}
