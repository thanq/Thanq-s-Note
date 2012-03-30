//Number : 
// 如果超过js 的数值范围 (Number.MIN_VALUE,Number.MAX_VALUE) : 这个数值将自动转为 特殊的 Infinity 值 , 可以用 isFinity()  来判断 
// isNaN : Not a Number 
Number("")  Number() //0
parseInt("")  parseInt() //NaN
Number("070")//70
parseInt("070")//56
parseInt(11,9)//10

parseFloat() //只解析 10 进制

String() : 如果为 unll -> 'unll' , undefined -> 'undefined' , other : -> o.toString() ;

Object :
	constructor:
	hasOwnProperty() // 检测给定的属性在当前对象实例 (而不是对象的原型) 中 , 给定参数必须以 "" 字符串形式指定
	isPrototypeOf() // 检测传入对象是否是该对象的原型 ? 
	propertyIsEnumerable("propertyName") // 检测给定属性能否用 for in 语句去枚举
	toString
	valueOf 
	
/*
ie 中非开发者定义 (bom , dom) 不遵循 
*/

typeof  用来确定 变量是否为基本类型 undefined number boolean string  很好用

ECMAScript 中所有的函数的参数都是按值传递的 ,和java 相同 
eg: 
function setName(obj){
	obj.name = "111";
	obj = new Object() ;
	obj.name = "222";
}
var person = new Object(); 
setName(obj)
log(obj.name) // 111

setName(obj) 函数执行时 函数中参数 被赋予 obj 的值 , 指向了内存中的a区域 ;
当 obj = new Object() 是 , obj 的值改变 指向了内存中的b区域 ; 但是由于 传递参数时是 将person的值(指向了内存中的a区域) 复制了一份
传到函数中的 , 所以函数中obj的值改变 不会影响 实际person的指向区域改变 ;
// 这个和 java 是一样的 ! 

// ! execution context : 执行环境 : 定义了函数 或 变量 有权访问的其他数据 , 决定了他们各自的行为  ; 每个执行环境都有一个与之关联的变量对象 visible Object ,环境中定义的所有变量 函数都保存在该对象中  解析器在处理数据时会在底层用到它 

// web 浏览器中 全局执行环境被认为是 window 对象   因此所有全局的变量和函数都是作为 window 的属性和方法创建的 

// 某个执行环境中的所有代码执行完毕后 , 该环境被销毁 , 保存在其中的所有变量和函数的定义也随之销毁  

每个函数在调用时都会创建自己的执行环境 . 当执行流进入一个环境时 , 函数的环境就会压入一个环境栈中 ; 函数执行之后 , 栈将该环境弹出 ,把控制权交给之前的执行环境 

代码在一个执行环境中执行时,会创建由变量对象构成的一个作用域链 scope chain ,其作用是保证对执行环境有权访问的所有变量和函数的有序访问



// 下拉菜单 ~ 定时炸弹 : 吐血 : ! 

// 导入过程 ~ 和王说下 : or 完成 ::: 完成 !
// 事务控制 ~ 等王 db 
// 导入导出 , 下载的日志 -- 