package sprites.fruit.product;

class PlumSprite extends FruitSprite
{
	public function new(X:Float, Y:Float)
	{
			super(X, Y);
			loadGraphic(AssetPaths.plum__png, true, 32, 32);
	}

	override public function create(X:Float, Y:Float):PlumSprite { return new PlumSprite(X,Y); }
}
