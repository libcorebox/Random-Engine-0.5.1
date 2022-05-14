#if web
import openfl.net.NetConnection;
import openfl.net.NetStream;
import openfl.events.NetStatusEvent;
import openfl.media.Video;
#else
import openfl.events.Event;
import vlc.VLCBitmap;
#end
import flixel.FlxBasic;
import flixel.FlxG;
#if android
import android.AndroidTools;
#end

class FlxVideo extends FlxBasic {
	#if VIDEOS_ALLOWED
	public var finishCallback:Void->Void = null;
	
	#if !web
	public static var vlcBitmap:VLCBitmap;
	#end

	public function new(name:String) {
		super();

		#if web
		var player:Video = new Video();
		player.x = 0;
		player.y = 0;
		FlxG.addChildBelowMouse(player);
		var netConnect = new NetConnection();
		netConnect.connect(null);
		var netStream = new NetStream(netConnect);
		netStream.client = {
			onMetaData: function() {
				player.attachNetStream(netStream);
				player.width = FlxG.width;
				player.height = FlxG.height;
			}
		};
		netConnect.addEventListener(NetStatusEvent.NET_STATUS, function(event:NetStatusEvent) {
			if(event.info.code == "NetStream.Play.Complete") {
				netStream.dispose();
				if(FlxG.game.contains(player)) FlxG.game.removeChild(player);

				if(finishCallback != null) finishCallback();
			}
		});
		netStream.play(name);        

		#elseif !web

		vlcBitmap = new VLCBitmap();

		vlcBitmap.onComplete = onVLCComplete;
		vlcBitmap.onError = onVLCError;

		FlxG.stage.addEventListener(Event.ENTER_FRAME, fixVolume);
		vlcBitmap.repeat = 0;
		fixVolume(null);

		FlxG.addChildBelowMouse(vlcBitmap);
		vlcBitmap.play(createUrl(name));
		#end
	}

	#if !web
	function createUrl(name:String)
	{
		#if android
		var checkedFile:String = AndroidTools.getFileUrl(name); // in android you need to put the location manualy for external storage thing
		#else
		var checkedFile:String = "file:///" + Sys.getCwd() + name; // this is how the video location needs to be
		#end
		return checkedFile;
	}

	function fixVolume(e:Event)
	{
		vlcBitmap.volume = 0;
		if(!FlxG.sound.muted && FlxG.sound.volume > 0.01) { //Kind of fixes the volume being too low when you decrease it
			vlcBitmap.volume = FlxG.sound.volume;
		}
	}

	public function onVLCComplete()
	{
		// Clean player, just in case!
		vlcBitmap.dispose();

		if (FlxG.game.contains(vlcBitmap))
		{
			FlxG.game.removeChild(vlcBitmap);
		}

		if (finishCallback != null)
		{
			finishCallback();
		}
	}

	
	function onVLCError()
		{
			trace("An error has occured while trying to load the video.\nPlease, check if the file you're loading exists.");
			if (finishCallback != null) {
				finishCallback();
			}
		}
	#end
	#end
}
