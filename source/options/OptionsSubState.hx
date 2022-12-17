package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

using StringTools;

class OptionsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Options';
		rpcTitle = 'Options Menu'; //for Discord Rich Presence

		var option:Option = new Option('Disable Camera Movement',
			"If checked, hitting notes won't move the camera.",
			'camMove',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Enable Smooth Healthbar',
			"If checked, health bar will be indie cross like.",
			'smoothHealthBar',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Note Sizing',
			"Change the note size.",
			'noteSize',
			'float',
			0.7);
			option.scrollSpeed = 1;
			option.minValue = 0.5;
			option.maxValue = 3.0;
			option.changeValue = 0.05;
			option.decimals = 2;
		addOption(option);
	
		// var option:Option = new Option('Time Bar:',
		// 	"What should the Time Bar display?",
		// 	'timeBarType',
		// 	'string',
		// 	'Time Left',
		// 	['Time Left', 'Time Elapsed', 'Song Name', 'Disabled']);
		// addOption(option);

		super();
	}
}
