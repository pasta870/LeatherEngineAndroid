package ui;

import openfl.display.BitmapData;
import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;
	public var isPlayer:Bool = false;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();

		this.isPlayer = isPlayer;

		// plays anim lol
		playSwagAnim(char);
		scrollFactor.set();
	}

	public function playSwagAnim(?char:String = 'bf')
	{		
		changeIconSet(charToAnimName(char));
	}

	public static function charToAnimName(char:String = 'bf'):String
	{
		// CONVERTING CERTAIN CHARS
		switch(char)
		{
			case 'mom-car':
				char = 'mom';
			case 'gf-car' | 'gf-christmas' | 'gf-old' | 'gf-pixel' | 'gf-tankmen':
				char = 'gf';
			case 'bf-car' | 'bf-christmas' | 'bf-holding-gf':
				char = 'bf';
			case 'monster-christmas':
				char = 'monster';
			case 'pico-speaker':
				char = 'pico';
		}

		return char;
	}

	public function changeIconSet(char:String = 'bf')
	{
		antialiasing = true;

		
		#if sys
		var graphicData = BitmapData.fromFile(Sys.getCwd() + "assets/images/icons/" + char + "-icons.png");

		loadGraphic(graphicData, true, 150, 150, false, char);

		// antialiasing override
		switch(char)
		{
			case 'bf-pixel' | 'gf-pixel' | 'senpai' | 'senpai-angry' | 'spirit':
				antialiasing = false;
		}

		animation.add(char, [0, 1, 2], 0, false, isPlayer);
		animation.play(char);
		#else
		loadGraphic(Paths.image('icons/' + char + '-icons'), true, 150, 150);

		// antialiasing override
		switch(char)
		{
			case 'bf-pixel' | 'gf-pixel' | 'senpai' | 'senpai-angry' | 'spirit':
				antialiasing = false;
		}

		animation.add(char, [0, 1, 2], 0, false, isPlayer);
		animation.play(char);
		#end
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
