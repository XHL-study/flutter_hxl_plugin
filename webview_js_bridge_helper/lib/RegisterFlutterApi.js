  /**
 * 注册flutter 与 html 通信api
 */
function RegisterChannelToHtml(apis) {
	window.flutterChannelApis = apis;
	window.__flutterChanneIsRegister = '1';
	var _self = this;
	(apis || []).forEach(function(item) {
		_self.__mockPostMessage(item);
	});
}

/**
 * mock channel postMessage
 * [xxx].PostMessage
 */
RegisterChannelToHtml.prototype.__mockPostMessage = function(channelName) {
	var _self = this;
	var _channel = window[channelName];
	window[channelName] = Object.create(_channel);
	var _postMessage = window[channelName].postMessage;
	window[channelName].postMessage = function(args) {
		args.callback = 'flutter_callback_' + Date.now();
		window[args.callback] = {
			success: function(res) {
				return args.success && args.success(res);
			},
			error: function(res) {
				return args.error && args.error(res);
			}
		}
		return _channel.postMessage(JSON.stringify(args));
	};	
}