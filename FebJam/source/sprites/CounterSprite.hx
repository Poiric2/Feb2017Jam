package sprites;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;

class CounterSprite extends FlxSprite
{
    private var value:Int;

    public var text(default,null):FlxText;
    public function new(?X:Float=0, ?Y:Float=0)
    {
        value = 0;
        super(X, Y);
        makeGraphic(32, 64, 0xFF7E625E);

        text = new FlxText(X,Y+6,32,""+value);
        text.setFormat("assets/fonts/GoodDog.otf", 40, 0xFFFFFFFF, CENTER);

        // text.loadGraphic(new FlxSprite(0,0,makeGraphic(32, 32, 0xFF9D8275)));
        // text.setFormat("assets/font/GoodDog.otf");
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

    public function setValue(v:Int):Void
    {
        value = v;
        text.text = "" + v;
    }

    public function getValue():Int
    {
        return value;
    }

}
