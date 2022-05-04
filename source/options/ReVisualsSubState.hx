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

class ReVisualsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Visuals';
		rpcTitle = 'Visuals Settings Menu'; // for Discord Rich Presence

		var option:Option = new Option('Icon Boping', 'If checked enables icon boping.', 'iconBoping', 'bool', false);
		addOption(option);

		var option:Option = new Option('Ms Text Color', 'If unchecked, disables coloring in the Ms text.', 'coloredMs', 'bool', true);
                addOption(option);

		var option:Option = new Option('KE Timebar', 'If checked, makes the timebar long like in Ke.', 'keTimeBar', 'bool', false);
		addOption(option);

		var option:Option = new Option('Tiny Fps Text', 'If checked, makes the fps text tiny, needs a restart.', 'tinyFpsTxt', 'bool', false);
                addOption(option);

		var option:Option = new Option('Rainbow FPS','If checked, makes the FPS have a chroma effect.','fpsRainbow','bool',false);
		addOption(option);

		var option:Option = new Option('Colored Ratings','If checked, colors the Ratings.','coloredRatings','bool',false);
//                addOption(option);
		
		var option:Option = new Option('Colored Combo','If checked, colors the combo','coloredCombo','bool',false);
//                addOption(option); bruh

		var option:Option = new Option('Timebar Color', 'The color of your Timebar.', 'timeBarColor', 'string', 'White', 
		['White', 'Blue', 'Cyan', 'Green', 'Red']);
                addOption(option);

		super();
	}
}
