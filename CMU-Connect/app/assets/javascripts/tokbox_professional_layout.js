var videos = 1;

	var publisher;
	var publisherObj;

	var subscribers = {};
	var subscriberObj = {};

	var MAX_WIDTH_VIDEO = 264;
	var MAX_HEIGHT_VIDEO = 198;

	var MIN_WIDTH_VIDEO = 200;
	var MIN_HEIGHT_VIDEO = 150;

	var MAX_WIDTH_BOX = 800;
	var MAX_HEIGHT_BOX = 600;

	var CURRENT_WIDTH = MAX_WIDTH_VIDEO;
	var CURRENT_HEIGHT = MAX_HEIGHT_VIDEO;

	function sessionConnectedHandler(event) {
		publish();

		for (var i = 0; i < event.streams.length; i++) {
			addStream(event.streams[i]);
		}
	}

	function streamCreatedHandler(event) {
		for (var i = 0; i < event.streams.length; i++) {
			addStream(event.streams[i]);
		}
	}

	function streamDestroyedHandler(event) {
		videos--;

		layoutManager();
	}


	function exceptionHandler(event) {
    	alert("Exception msg:" + event.message + "title: " + event.title + " code: " + event.code);
	}

	//--------------------------------------
	//  HELPER METHODS
	//--------------------------------------
	function addStream(stream) {
		// Check if this is the stream that I am publishing. If not
		// we choose to subscribe to the stream.
		if (stream.connection.connectionId == session.connection.connectionId) {
			return;
		}

		var div = document.createElement('div');	// Create a replacement div for the subscriber
		var divId = stream.streamId;	// Give the replacement div the id of the stream as its id
		div.setAttribute('id', divId);
		document.getElementById("videobox").appendChild(div);
		subscriberObj[stream.streamId] = div; 
		subscribers[stream.streamId] = session.subscribe(stream, divId, {"width": CURRENT_WIDTH, "height": CURRENT_HEIGHT});

		videos++;
		layoutManager();
	}

	function publish() {
		if (!publisher) {
			var parentDiv = document.getElementById("videobox");
			publisherObj = document.createElement('div');			// Create a replacement div for the publisher
			publisherObj.setAttribute('id', 'opentok_publisher');
			parentDiv.appendChild(publisherObj);
			publisher = session.publish('opentok_publisher', {"width": CURRENT_WIDTH, "height": CURRENT_HEIGHT});
		}
	}

	function layoutManager() {
		var estBoxWidth = MAX_WIDTH_BOX / videos;
		var width = Math.min(MAX_WIDTH_VIDEO, Math.max(MIN_WIDTH_VIDEO, estBoxWidth));
		var height = 3*width/4;

		publisherObj.height = height;
		publisherObj.width = width;

		for(var subscriberDiv in subscriberObj) {
			subscriberDiv.height = height;
			subscriberDiv.width = width;
		}

		CURRENT_HEIGHT = height;

		CURRENT_WIDTH = width;
	}
