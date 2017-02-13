package sprites.fruit.product;

class GrapeSprite extends FruitSprite
{
	public function new(X:Float, Y:Float)
	{
			super(X, Y);
			loadGraphic(AssetPaths.grape__png, true, 32, 32);
	}

	override public function create(X:Float, Y:Float):GrapeSprite { return new GrapeSprite(X,Y); }
}
