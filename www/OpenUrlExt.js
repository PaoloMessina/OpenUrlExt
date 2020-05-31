//
//  Paolo Messina
//
//  Created by Paolo Messina on 06/07/15.
//
//

var argscheck = require('cordova/argscheck'),
    exec      = require('cordova/exec');

function OpenUrlExt () {};

OpenUrlExt.prototype = {

    open: function (url, success, failure, params)
    {
    	var urlHashed;
    	if(params && params.encode == false)
    		urlHashed = url;
    	else 
    		urlHashed = encodeURI(url);
    	var agent = navigator.userAgent.toLowerCase();
        //need to exclude windows due to IE/EDGE userAgent spoofing
    	var isAndroid = /android/.test(agent) && !/windows/.test(agent)
    	if(isAndroid){
    		if(navigator && navigator.app && navigator.app.loadUrl)
    			navigator.app.loadUrl(urlHashed, {openExternal : true});
    		else {
    			window.open(urlHashed, '_system');
    		}
    	} else {
    		exec(success, failure, 'OpenUrlExt', 'open', [url]);
    	}
    }
};

module.exports = new OpenUrlExt();
