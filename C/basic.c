gcc test.c  -Wall -o  test   // -Wall 提示错误信息 
//在Linux平台上最广泛使用的C函数库是glibc，其中包括C标准库的实现 
//，-lm选项告诉编译器，我们程序中用到的数学函数要到 libm.so 这个库文件里找 

echo $? 可以查看上一条命令的返回状态 
//$?是Shell中的一个特殊变量，表示上一条命令的退出状态

设计void这么一个关键字的原因：首先从语法上规定没有返回值的函数调用表达式有一个void类型的值，这样任何表达式都有值，不必考虑特殊情况，编译器的语法解析比较容易实现；然后从语义上规定void类型的表达式不能参与运算，因此
newline() + 1这样的表达式不能通过语义检查，从而兼顾了语法上的一致和语义上的不矛盾。

分配存储空间的变量声明才是变量定义 

局部变量可以用与类型相符的任意表达式来初始化，而全局变量只能用常量表达式（Constant Expression）初始化。
程序开始运行时要用适当的值来初始化全局变量，所以初始值必须保存在编译生成的可执行文件中，因此初始值在编译时就要计算出来
int minute = 360;
int hour = minute / 60; // 这样定义常量是非法的 
如果全局变量在定义时不初始化则初始值是0，
如果局部变量在定义时不初始化则初始值是不确定的。所以，局部变量在使用之前一定要先赋值

C 中 , 变量未初始化 : 值是尼玛 随机的 ; 和java 不同 

在C中 用 0 和 非0  表示 false 和 true 

声明结构体 :
	struct ComplexStruct {
		double x,y;
	} cs1 ,cs2 ;
	struct ComplexStruct cs3, cs4 ;
如果不加 tag :
	struct {double x, y; } cs1 ,cs2 ; //不过这样就没法再次引用这个结构体类型了, 应为他没有名字 
	
	结构体可以在声明时赋值 :
		struct ComplexStruct temp1 {x , 2.0} ;// 变量x , 不适用于全局变量 
		struct ComplexStruct temp1 {2.0 , } ;// x=2.0 , y=0.0
		struct ComplexStruct temp1 {2.0} ;// x=2.0 , y=0.0
		struct ComplexStruct temp1 {2.0} ;// x=2.0 , y=0.0
		struct ComplexStruct temp1 {.y=2.0} ;// x=0.0 , y=0.0
	{} 这种语法不适用于结构体的赋值 : 
		struct ComplexStruct temp1  ;
		struct temp1 = {2.0} ; // 这样是不对的 : 
嵌套结构体
struct segment {
	struct complex_struct start;
	struct complex_struct end;
};
struct segment s = {{ 1.0, 2.0 }, { 4.0, 6.0 }};
struct segment s = { 1.0, 2.0, 4.0, 6.0 };
struct segment s = { .start.x = 1.0, .end.x = 2.0 };	

结构体作为函数参数 : 传值 : 就是方法中会接受 结构体类型的一个结构 : 而不是结构体的地址
结构体赋值 : 与java不同 ,不是简单的传地址, 而是就新建了个一摸一样的结构体

定义枚举
	enum coordinate_type { RECTANGULAR = 1, POLAR };// 如果不先 R=1 ,就是从0开始赋值
	
数组和结构体虽然有很多相似之处，但也有一个显著的不同：数组不能相互赋值或初始化。
既然不能相互赋值，也就不能用数组类型作为函数的参数或返回值。

int array[5] = {0};
foo(array);
编译器也不会报错，但这样写并不是传一个数组类型参数的意思。
对于数组类型有一条特殊规则：数组类型做右值使用时，自动转换成指向数组首元素的指针。
所以上面的函数调用其实是传一个指针类型的参数，而不是数组类型的参数。
这也解释了为什么数组类型不能相互赋值或初始化，例如上面提到的a = b这个表达式，a和b都是数组类型的变量，但是b做右值使用，自动转换成指针类型，而左边仍然是数组类型，所以编译器报的错是error: incompatible types in assignment。

// include 和 define 都是预处理指示
#include <stdlib.h>
#define N 100000


char c = "abc"[0];
"abc"[0] = 'c' ;// 字符串字面值是只读的,不能修改;字面值做右值时会自动转为指向首元素的指针 

char str[10] ="abc"; //不可以向java一样 : char[] str ;只能 char str[n] ;
相当于
char str[10] = {'a','b','c','\0'}

/*summarize*/
1、C的语法规则。

    源文件中所有函数定义之外可以出现哪些语法元素？
		预编译信息 , 包括
			头文件  
				#include <stdio.h>
			定义常量 
				#define  M  1 
			声明全局变量
				int i = 46/M ;
			声明结构体
				struct ComplexStruct {
					double x,y;
				} cs1 ,cs2 ;
			声明枚举
				enum coordinate_type { RECTANGULAR = 1, POLAR };// 如果不先 R=1 ,就是从0开始赋值
			
