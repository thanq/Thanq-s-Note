// 未完成 : 
http://paulirish.com/2009/perf/


// 1 .add dom 
var frag = document.createDocumentFragment();
$.each(arr , function(count , item){
	var newLi = '<li>'+item+'</li>';
	frag.appendChild(newLi);
});
$('#ballers')[0].appendChild(frag);
// or 
var myHtml = '';
$.each(arr , function(count , item){
	myHtml += '<li>'+item+'</li>';
});
$('#ballers').html(myHtml);

//2. if you're repeating yourself , you are doing it wrong
/*bad*/ 
if($ventfade.data('currently')!='showing'){
	$ventfade.stop();
} 
if($ventover.data('currently')!='showing'){
	$ventfade.stop();
} 
/*right*/
var elems = [$ventfade , $ventover];
$.each(elems, function(k,v){
	if(v.date('currently')!='showing'){
		v.stop();
	}
});

// 3 . all is Object Literal 
	// can execute these  from  console ...
	// can write unit test against them 
	// profilers give you actual names to work with 
	// easier to navigate and discuss  

// 4 not the requery 
	//bad 
	//create and append you element 
	$(document.body).append("<div class='baaron'/>");
	$("div.baaron").click(function(){});
	
	//better 
	$("<div class='baaron'/>").appendTo(document.body).click(
		function(){}
	);
	
// 5 
	// this is not the .context property 
	var bodySheets = $('' , document.body);
	bodySheets.context // => BODY element 
	
	
	


