/* unique-3.0.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Unique", gir_namespace = "Unique", gir_version = "3.0", lower_case_cprefix = "unique_")]
namespace Unique {
	[CCode (cheader_filename = "unique/unique.h", type_id = "unique_app_get_type ()")]
	public class App : GLib.Object {
		[CCode (has_construct_function = false)]
		public App (string name, string? startup_id);
		public void add_command (string command_name, int command_id);
		public Unique.Response send_message (int command_id, Unique.MessageData? message_data);
		public void watch_window (Gtk.Window window);
		[NoAccessorMethod]
		public bool is_running { get; }
		[NoAccessorMethod]
		public string name { owned get; construct; }
		[NoAccessorMethod]
		public Gdk.Screen screen { owned get; set construct; }
		[NoAccessorMethod]
		public string startup_id { owned get; construct; }
		public virtual signal Unique.Response message_received (int command, Unique.MessageData message_data, uint time_);
	}
	[CCode (cheader_filename = "unique/unique.h", type_id = "unique_backend_get_type ()")]
	public abstract class Backend : GLib.Object {
		[CCode (has_construct_function = false)]
		protected Backend ();
		public static Unique.Backend create ();
		public unowned string get_name ();
		public unowned Gdk.Screen get_screen ();
		public unowned string get_startup_id ();
		public uint get_workspace ();
		public virtual bool request_name ();
		public virtual Unique.Response send_message (int command_id, Unique.MessageData message_data, uint time_);
		public void set_name (string name);
		public void set_screen (Gdk.Screen screen);
		public void set_startup_id (string startup_id);
	}
	[CCode (cheader_filename = "unique/unique.h", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "unique_message_data_get_type ()")]
	[Compact]
	public class MessageData {
		[CCode (has_construct_function = false)]
		public MessageData ();
		public Unique.MessageData copy ();
		public void free ();
		public uint8 @get (out size_t length);
		public string get_filename ();
		public unowned Gdk.Screen get_screen ();
		public unowned string get_startup_id ();
		public string get_text ();
		[CCode (array_length = false, array_null_terminated = true)]
		public string[] get_uris ();
		public uint get_workspace ();
		public void @set (uint8? data, ssize_t length);
		public void set_filename (string filename);
		public bool set_text (string str, ssize_t length);
		public bool set_uris ([CCode (array_length = false, array_null_terminated = true)] string[] uris);
	}
	[CCode (cheader_filename = "unique/unique.h", cprefix = "UNIQUE_")]
	public enum Command {
		INVALID,
		ACTIVATE,
		NEW,
		OPEN,
		CLOSE
	}
	[CCode (cheader_filename = "unique/unique.h", cprefix = "UNIQUE_RESPONSE_")]
	public enum Response {
		INVALID,
		OK,
		CANCEL,
		FAIL,
		PASSTHROUGH
	}
}
