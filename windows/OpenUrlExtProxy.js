cordova.commandProxy.add("OpenUrlExt", {
	open: function (successCallback, errorCallback, params) {
		var uri = new Windows.Foundation.Uri(params[0]);
		Windows.System.Launcher.launchUriAsync(uri).done(
        function (success) {
            if (success) { 
            	console.log("page opened correctly"); 
            }
            else { 
            	console.log("an error has occured");
            	 }
            });
	}
});
