package sprites.fruit.product;

class BananaSprite extends FruitSprite
{
	public function new(X:Float, Y:Float)
	{
			super(X, Y);
			loadGraphic(AssetPaths.banana__png, true, 32, 32);
	}

	override public function create(X:Float, Y:Float):BananaSprite { return new BananaSprite(X,Y); }
}
