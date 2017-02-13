package sprites.fruit.product;

class PearSprite extends FruitSprite
{
	public function new(X:Float, Y:Float)
	{
			super(X, Y);
			loadGraphic(AssetPaths.pear__png, true, 32, 32);
	}

	override public function create(X:Float, Y:Float):PearSprite { return new PearSprite(X,Y); }
}
