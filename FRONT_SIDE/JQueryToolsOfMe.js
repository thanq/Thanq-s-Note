/**
	使元素居于屏幕中间
*/
	jQuery.fn.center = function () {  
		this.css("position","absolute");  
		this.css("top", ( $(window).height() - this.height() ) / 2+$(window).scrollTop() + "px");  
		this.css("left", ( $(window).width() - this.width() ) / 2+$(window).scrollLeft() + "px");  
		return this;  
	}  
	$("#id").center();  


/**
	外部加载:
*/



/**  跳到顶部的动画 */
$('a[href*=#]').click(function() {  
	if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {  
		var $target = $(this.hash);  
		$target = $target.length && $target  || $('[name=' + this.hash.slice(1) +']');  
		if ($target.length) {  
			var targetOffset = $target.offset().top;  
			$('html,body') .animate({scrollTop: targetOffset}, 900);  
			return false;  
		}  
	}
} 


/**  禁用右键 
$(document).bind("contextmenu",function(e){   
	return false;   
});   
 */


 
 /**
	日志系统 
 */
 function log() {
	if ($.fn.debug) {// 先定义 debug = true 
		var msg = '[jquery.form] ' + Array.prototype.join.call(arguments,'');
		if (window.console && window.console.log) {
			window.console.log(msg);
		}
		else if (window.opera && window.opera.postError) {
			window.opera.postError(msg);
		}
	}
};




