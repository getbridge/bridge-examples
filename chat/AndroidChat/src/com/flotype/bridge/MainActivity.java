package com.flotype.bridge;

import java.io.IOException;


import org.apache.log4j.Level;


import android.app.Activity;
import android.os.Bundle;
import android.os.Environment;
import android.widget.TextView;
import de.mindpipe.android.logging.log4j.LogConfigurator;

public class MainActivity extends Activity {
	
	interface RemoteChat extends BridgeRemoteObject {
		public void message(String sender, String message);
	}



	interface RemoteAuth extends BridgeRemoteObject {
		public void join(String room, String pass, ChatObj obj, BridgeObject cb);
	}

    static {
        final LogConfigurator logConfigurator = new LogConfigurator();

        logConfigurator.setUseFileAppender(false);
        logConfigurator.setRootLevel(Level.DEBUG);
        // Set log level of a specific logger
        logConfigurator.setLevel("org.apache", Level.ERROR);
        logConfigurator.configure();
    }
	
	interface RemoteGreeter extends BridgeRemoteObject {
		public void greet(String name, BridgeObject callback);
	}

	Bridge bridge;

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);

		bridge = new Bridge("abcdefgh");
		try {
			RemoteAuth auth = bridge.getService("auth", RemoteAuth.class);
			auth.join("bridge-lovers", "secret123", new ChatObj(), new BridgeObject() {
				public void callback(RemoteChat channel, String channelName) {
					
				}
			});
			bridge.connect();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void updateText(final String text) {
		runOnUiThread(new Runnable() {
		     public void run() {
		 		TextView textView = (TextView) findViewById(R.id.text);
				textView.append("\n" + text);
		    }
		});

	}
	
	class ChatObj implements BridgeObject {
		public void message(String sender, String message) {
			MainActivity.this.updateText(sender + ": " + message);
		}
	}

}