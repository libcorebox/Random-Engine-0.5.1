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

class ReUISubState extends BaseOptionsMenu
{
	public function new()
	{
		var option:Option = new Option('Score Type:', "What should the score be like?", 'scoreType', 'string', 'Kade Engine',
			['Kade Engine', 'Psych Engine', 'Disabled']);
		addOption(option);
		
		var option:Option = new Option('Ratings Type:', "What should the ratings be like?", 'scoreType', 'string', 'Random Engine',
                        ['Random Engine', 'Psych Engine', 'Kade Engine']);
  //              addOption(option); aww men

		var option:Option = new Option('Score Style:', "What should the score look like?", 'scoreStyle', 'string', 'Random Engine',
			['Random Engine', 'Psych Engine', 'Score Only']);
		addOption(option);

		var option:Option = new Option('Memory Counter', 'If checked, enables the memory counter.', 'memoryCounter', 'bool', false);
		addOption(option);

		var option:Option = new Option('Memory Counter Peak', 'If checked, adds the peak to the memory counter.', 'memoryCounterPeak', 'bool', false);
                addOption(option);

		var option:Option = new Option('Health Counter', 'If checked, enables the health counter.', 'healthCounter', 'bool', false);
		addOption(option);

		var option:Option = new Option('Judgements', 'If unchecked, hides judgements.', 'judgements', 'bool', true);
		addOption(option);

		var option:Option = new Option('Song Info', 'If unchecked, hides Song info.', 'songInfo', 'bool', true);
		addOption(option);

		var option:Option = new Option('Ke Title Screen', 'If checked uses the ke title screen', 'keTitleScreen', 'bool', false);
                addOption(option);

		var option:Option = new Option('Play Hit Sounds', 'If checked enables hit sound.', 'playHitSound', 'bool', false);
		addOption(option);

		var option:Option = new Option('MS Text', 'If unchecked, disables the ms text.', 'msTxt', 'bool', true);
                addOption(option);

		var option:Option = new Option('Normal Combo Count', 'If checked adds extra 0es to the combo counter.', 'normalCombo', 'bool', false);
		addOption(option);

		var option:Option = new Option('Detached Ratings', 'If checked, detaches the ratings from the camera.(independent from detached HUD)', 'detachedRatings','bool', false);
		addOption(option);

		var option:Option = new Option('Detached HUD', 'If checked, detaches the HUD (except the controls) from the camera.', 'detachedHUD', 'bool', false);
		addOption(option);

		var option:Option = new Option('noteSkin :', 'What should your notes look like?', 'noteSkin', 'string', 'Arrow',
                        ['Arrow', 'Circle']);
                addOption(option);

		var option:Option = new Option('Arrows Opacity', 'How Opaque should the arrows be.', 'arrowOpacity', 'percent', 1);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		addOption(option);

		var option:Option = new Option('Lane Opacity', 'How Opaque should the lane underlay be.', 'laneOpacity', 'percent', 1);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		addOption(option);

		var option:Option = new Option('Enemy Lane Opacity', 'How Opaque should the opponent lane be.', 'opponentLaneOpacity', 'percent', 0);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		addOption(option);

		var option:Option = new Option('Enemy Arrows Opacity', 'How Opaque should the opponent arrows be.', 'opponentArrowOpacity', 'percent', 0);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		addOption(option);
	
		var option:Option = new Option('Pause Screen Song:', "What song do you prefer for the Pause Screen?", 'pauseMusic', 'string', 'Tea Time', ['None', 'Breakfast', 'Tea Time']);
		addOption(option);
		option.onChange = onChangePauseMusic;

		super();
	}

	var changedMusic:Bool = false;
	function onChangePauseMusic()
	{
		if(ClientPrefs.pauseMusic == 'None')
			FlxG.sound.music.volume = 0;
		else
			FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath(ClientPrefs.pauseMusic)));
		changedMusic = true;
	}

	override function destroy()
	{
		if(changedMusic) FlxG.sound.playMusic(Paths.music('freakyMenu'));
		super.destroy();
	}
}
