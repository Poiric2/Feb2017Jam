package sprites.fruit;

import sprites.fruit.product.*;

/******************************************************************************/
/*                             FRUITSPRITEFACTORY                             */
/******************************************************************************/

class FruitSpriteFactory
{
  private var _factory_:Array<FruitSprite> = null;

  public function new() {
    // Create the factory Array that contains all the items we can create
    _factory_ = new Array<FruitSprite>();
    _factory_.push(new AppleSprite(0,0));
    _factory_.push(new BananaSprite(0,0));
    _factory_.push(new CoconutSprite(0,0));
    _factory_.push(new GrapeSprite(0,0));
    _factory_.push(new KiwiSprite(0,0));
    _factory_.push(new PearSprite(0,0));
    _factory_.push(new PlumSprite(0,0));
    _factory_.push(new WatermelonSprite(0,0));
  }

  /****************************************************************************/
 	/*                             PRODUCT CREATION                             */
 	/****************************************************************************/

  // Takes an ID and creates the desired fruit
  public function makeProduct(ID:Int,X:Float,Y:Float):FruitSprite
  {
    if (ID < 0 || ID >= _factory_.length) return null;

    return _factory_[ID].create(X,Y);
    return null;
  }
}
