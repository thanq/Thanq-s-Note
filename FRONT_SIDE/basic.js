typeof [] ;// 'object' 
Object.prototype.toString.call([]) //'[object Array]'
typeof '' ; // 'string' 
typeof null ;//'object'
typeof 3 ; // 'number'
 
 function f (){
	console.log(arguments);
	console.log(this);
 }
 f(1)//[1] // 
 f.apply(this , [] ) 
 //==
 f.call(this , arr1 ,arr2 ...)
 //If the first argument passed to call/apply is null or undefined, this will refer to the global object 
 
 // bind 绑定