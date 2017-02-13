package sprites.fruit.product;

class KiwiSprite extends FruitSprite
{
	public function new(X:Float, Y:Float)
	{
			super(X, Y);
			loadGraphic(AssetPaths.kiwi__png, true, 32, 32);
	}

	override public function create(X:Float, Y:Float):KiwiSprite { return new KiwiSprite(X,Y); }
}
