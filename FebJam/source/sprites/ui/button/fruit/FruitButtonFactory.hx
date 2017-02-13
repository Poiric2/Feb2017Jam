package sprites.ui.button.fruit;

import sprites.ui.button.fruit.product.*;

/******************************************************************************/
/*                             FRUITBUTTONFACTORY                             */
/******************************************************************************/

class FruitButtonFactory
{
  private  var _factory_:Array<FruitButton> = null;

  public function new() {
    // Create the factory Array that contains all the items we can create
    _factory_ = new Array<FruitButton>();
    _factory_.push(new AppleButton(0,0,"",function():Void {}));
    _factory_.push(new BananaButton(0,0,"",function():Void {}));
    _factory_.push(new CoconutButton(0,0,"",function():Void {}));
    _factory_.push(new GrapeButton(0,0,"",function():Void {}));
    _factory_.push(new KiwiButton(0,0,"",function():Void {}));
    _factory_.push(new PearButton(0,0,"",function():Void {}));
    _factory_.push(new PlumButton(0,0,"",function():Void {}));
    _factory_.push(new WatermelonButton(0,0,"",function():Void {}));
  }

  /****************************************************************************/
 	/*                             PRODUCT CREATION                             */
 	/****************************************************************************/

  // Takes an ID and creates the desired fruit
  public function makeProduct(ID:Int,X:Float,Y:Float,text:String,func:Void->Void):FruitButton
  {
    if (ID < 0 || ID >= _factory_.length) return null;

    return _factory_[ID].create(X,Y,text,func);
  }
}
