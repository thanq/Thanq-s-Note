//Refining & Filter Selections 
// 可以 对 选择器 里的dom 进行进一步筛选
//Refinng  ReFind 
$("div.foo").has("p");//  div.foo element that contain <p>'s //注意 包含是含有该子元素
$("h1").not(".bar");// 不涉及包含关系 : 没有.bar 的 h1 element  
$("ul li").filter(".currentf");//class = currentf 的 ul>li
$("ul li").first();
$("ul li").eq(5); // the sixth

// jQuery offers several pseudo-selectors that help you find element in you forms :
// 最好只是在不好利用css选择器的时候用 
$("#myForm :button") 

/*
 * jQuery selection Methods generally  come in two different flavors : 
 * getters and setters
 * getters return a property of the first selected element 
 * setters set a property  on all all selected element & return jQuery object
 */

/**
 * 编程规范: 将链式操作分行写:
 */
/*eg : */$("#content")
			.find("h3")
			.eq(2)
				.html("3rd")
			.end()
			.eq(0)
				.html("first");
			
/** CSS*/
$("h1").css("fontSize"/*Or font-size*/ ,"100px");
$("h1").css({"fontSize":"100px","color":"red"});//setting multiple properties
// many jQuery methods accept objects to set multiple values at once 
// .css method 在生产环境中要尽量避免.. 

//$("..").addClass("").removeClass("'").toggleClass("")
// if($h1.hasClass("")){.....}

/** Dimensions */
$("h1").height();// context
$("h1").innerHeight();//context + padding 
$("h1").outerHeight(); // ccontext + padding + border ; return num , no px;
$("h1").outerHeight(true); // context + padding + border + margin 
$("h1").position();//return a obj  // information for the first H1 relative to
                         // its "offset (positioned) parent" //相对于其parent的 offset 偏移

$(window).height();// browser viewprot 
$(document).height();// doc

/**
 * Traversing 遍历
Once you have a jQuery selection,
you can find other elements using your selection as a starting point
 */
$("h1").add("h2");// return a new jQuery Object 



/** moving , copying and removing element */
$.fn.appendTo() // return 还是它自己 :如果是已经存在的元素 , 剪切 + 粘贴
$.fn.append() // return append 后的 元素 
// 如果不想剪切的话
$.fn.clone().appendTo() 
$.fn.clone().appendTo(true) // 将相关数据和事件也复制


$.fn.remove() // 移除 , 不返回该元素 , 绑定事件 , 数据 将不可用 
$.fn.detach() // 分离  return 它自己  , 相关数据还保留
$.fn.detach() // 可以 先将元素剖离 进行计算  进而避免昂贵的 dom touches
// 如果只是想移除其中内容的话 :
$.fn.empty()// empty innerHtml 






$.trim
$.inArray
$.extend
$.proxy
pageX, pageY
type
which
data
target
preventDefault()
stopPropagation()
$.fn.show
$.fn.hide
$.fn.fadeIn
$.fn.fadeOut
$.fn.slideDown
$.fn.slideUp
$.fn.slideToggle
$.fn.stop
$.fn.delay
jQuery.fx.off
text
html
script
json
jsonp
xml
async
cache
complete
context
data
dataType
error
jsonp
success
timeout
traditional
type
url
$.get
$.post
$.getScript
$.getJSON
url
data
success callback
data type
refresh
populate
remove
collapse
expand
getResults
log: getTrends
$().css()
/** Utility Method*/
/*$.extend*/
//$.extend(first, second) 将 second 覆盖下 first then return first;
if(typeof(obj) == "object"){
	config = $.extend(config , obj);
	// or $.extend(config , obj );
}
// if your don't want to chang any of the object you pass to $.extend , 
// pass an empty object as the  first argument 
config = $.extend({}, config , obj);

/*$.proxy*/
// Returns a function (first argument) always run in the provided scope (second argument)
var myObject = {
    myFn : function() {
        console.log(this);
    }
};

$('#foo').click(myObject.myFn); // logs DOM element #foo
$('#foo').click($.proxy(myObject, 'myFn')); // logs myObject


// determining the type of a specific value 
jQuery.isArray([]); // true 
typeof [] // "object"

/*jQuery offer a straightforward  way to store date related to an element ,and it manages memery issues for you   	*/
$('#myDiv').data('keyName', { foo : 'bar' });
$('#myDiv').data('keyName'); // { foo : 'bar' }
// 可以将一个引用存到该元素上(在元素之间建立关系)

/**
 * EVENT
 */
/*
 * connecting Event to elements
 */
$('input').bind(
    'click change',  // bind to multiple events
    { foo : 'bar' }, // pass in data

    function(eventObject) {
        console.log(eventObject.type, eventObject.data);
        // logs event type, then { foo : 'bar' }
    }
);

// bind to multiple events with different function ;jQuery1.44+
$('p').bind({
	'click': function() { console.log('clicked!'); },
	'mouseover': function() { console.log('hovered!'); }
});

/*
 * connecting Events to run only once 
 */
$('p').one('click',function(){});// 每个p 元素都绑定个只执行一次的fun

/*
 * disconnecting Events
 */
$().unbind('click');
// if you attached a named function to the event 
/*you can:*/$().unbind("click",foo); //从而只解除特定的绑定函数
/*Namespacing Events*/
$('p').bind('click.myNamespace', function() { /* ... */ });
$('p').unbind('click.myNamespace');
$('p').unbind('.myNamespace'); // unbind all events in the namespace


/**
 * Inside the event handling funciton 
 */


// Triggering event
 $('p').trigger('click') ; // all 


/**
 * Increasing Performance with event delegation
 */
// 这样在 增加了元素后 就不用添加事件到元素上了 , 在元素比较多的情况下  可以优化性能
$("#myList").delegate('li' , 'click' ,function(){}); 	
/*unbuilding delegated events */
$("#myList").undelegate('li' , 'click' ); 	


$().hover(function(){}) // 

$().toggle() // 在每个元素上每单击一次 , 执行列表中的下个事件


