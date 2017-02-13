package sprites.ui.button.fruit;

import flixel.ui.FlxButton;

class FruitButton extends FlxButton
{
  public function create(X:Float,Y:Float,text:String,func:Void->Void):FruitButton { return new FruitButton(X,Y,text,func); }
}
