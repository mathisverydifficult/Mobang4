/**
 * 
 */

$(function () {
		$(document).ready(function () {
			var token = $("meta[name='csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(header, token);
			});
		});
	});