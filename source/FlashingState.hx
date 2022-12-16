package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxTimer;

class FlashingState extends MusicBeatState
{
	public static var leftState:Bool = false;
	var elaps:Float;

	var warnText:FlxText;
	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		warnText = new FlxText(0, 0, FlxG.width,
			"Heyo, Just a warning!\n
			This Mod may contains some flashing lights!\n
			Please press ENTER to enable them now.\n
			Press ESCAPE to disable them now.\n
			You can change these in the options menu.",
			32);
		warnText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter(Y);
		warnText.scale.set(5, 5);
		add(warnText);
	}

	override function update(elapsed:Float)
	{
		elaps += elapsed;
		FlxTween.tween(warnText.scale, { x: 1, y: 1 }, 3, { ease:FlxEase.backOut });
		warnText.angle = 5 * Math.sin(elaps + 0.25);
		if(!leftState) {
			var back:Bool = controls.BACK;
			if (controls.ACCEPT || back) {
				leftState = true;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				if(!back) {
					ClientPrefs.flashing = true;
					ClientPrefs.saveSettings();
					FlxG.sound.play(Paths.sound('confirmMenu'));
					FlxFlicker.flicker(warnText, 1, 0.1, false, true, function(flk:FlxFlicker) {
						new FlxTimer().start(0.5, function (tmr:FlxTimer) {
							MusicBeatState.switchState(new TitleState());
						});
					});
					FlxTween.tween(warnText.scale, { x: 2, y: 2 }, 3, { ease:FlxEase.backOut });
					trace("Enabled");
				} else {
					ClientPrefs.flashing = false;
					FlxG.sound.play(Paths.sound('cancelMenu'));
					FlxTween.tween(warnText, {alpha: 0}, 1, {
						onComplete: function (twn:FlxTween) {
							MusicBeatState.switchState(new TitleState());
						}
					});
					trace("Disabled");
				}
			}
		}
		super.update(elapsed);
	}
}
