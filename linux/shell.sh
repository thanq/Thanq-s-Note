#! /bin/awk -f        //  指明是 AWK 程序   /bin/bash : 指明是bash 程序
wc -l 取到行数  == grep -c  ... 

; 用来分开同行的命令
/dev/null  : 输入该文件 的内容会被抛弃  > /dev/null : 流写入 null , 而不是标准输出流 
/dev/tty :  当程序打开该文件时, 会将它定位到一个终端  //  常用来提示输入密码 
printf "enter  your password "
stty -echo            #关闭自动打印输入字符的功能 
read pass < /dev/tty #读取密码 
stty echo            #打开自动打印输入字符的功能 
grep  #列出符合匹配的每一行 
	man -k sed | grep ^sed # 取到所以以 sed 开头的 
在 脚本里 可以使用 $1 $(10) 来取得 输入的参数 

set -x # 打开跟踪功能 显示被执行到的命令 
set +x # 关闭跟踪功能

查找文本 
	grep 
		grep -v a # -v  取反
	egrep  # extended grep 
		egrep 'a|b'
	fgrep	# fast grep :匹配固定字符串而不是正则表达式 
	
替换文本 
	sed # stream editor for filtering and transforming file 
	echo 111 | sed 's;1;2;'  # s; 定义 转义界定符 
	echo 111 | sed 's;1;2;g'  # g 说明为全局替换  而不是每行只替换一个
	echo 111 | sed 's;\(1\);0\1;' # () 要添加转义  \1  : 第一组 
	echo 111 | sed 's;\(1\);0\1;2' #  匹配第二个
	
	通过 sed -e 可以一次替换多组   也可以用 sed -f  
 
	sed -n '/HTML/p' 显示 含有 HTML 这行  等效于 grep HTML ...
	sed -n '$p' 显示文本最后一行 , 很有用 ...
	
	sed -n '1,3p' ... 打印1 - 3 行 
	sed '/begin/,/end/ s;.;*;g'  ... 仅匹配范围之间的行 
	sed '/begin/! s;.;*;g'  ... 仅匹配 不匹配正则表达式 的行 
	
	sed '/^#/d' ... 等效于 grep -v '^#' ...
	
剪切文本
	cut 从输入中选择一个或多个字段 或一组数据
	cut -c 1,2-10  选择每行的第 n  个字符 
	cut -d : -f 2 ...  以 : 为分界符 的 第二 组   分界符默认为 tab 键
	
使用join 连接字段 
	join  -t' ' q1 q2
	以共同的一个键值 , 将文件内的记录加以结合

awk -F : '{ print $1 , $2} '	/etc/passwd 
awk -F : -v 'OFS=**'  '{ print $1 , $2} '	/etc/passwd   #改变输出的分隔符 由 span 为 **  
	等效于
awk 'BEGIN {FS=":" ; OFS="**"}
	{print $1 ,$2 }' etc/passwd

printf 如何输出 ' " ? '




awk 'NF>0  {print $0}  '  # 打印非空行 
awk ' NF>0 '   没有 {} action  默认为打印 

uniq 去除重复行
uniq -c 显示重复次数
uniq -u 只显示非重复行
uniq -d 只显示重复行

wc -c 统计字节数
wc -l 行数
wc -w 单词数

取得文件前几行

	head -n 2 xxx
	awk 'FNR<=2' xxx
	sed 2q
尾几行
	tail -n 2 xxx
	tail -n 2 -f xxx  : 进入循环 : 如果xxx 有改变 就取出新数据 , 常用来观察不断增长的日志文件
	
cat /etc/group | sort -t: -k3nr  | head  -n 10 
cat /etc/group | sort -t: -k3,3nr  | head  -n 10 
用 : 分割 的 第 3 列 排序 , 指定为数字类型 , 和反序 i 


trap # 管理操作系统信号


# 文件与文件系统 
unix 文件名中间表有span ; shell中使用不方便 

mount -t vboxsf share mount_point ? 
http://www.ludou.org/virtualbox-sharedfolder.html // 共享文件设置

umask  # show the current permission mask 
024 # 000 	010 	100		// 11 10 10 //  r w x ; x 这里不管用 // umask 的 r w 位有 , 文件就没有 
新建文件的初始权限为 : rw-    r--    -w-

chmod ug+x fileName
x r w 
u: user 	g: group	o: other 	a: all

touch # carete an empty file  
stat # 可以查看 INode 

# 
变量 判断 重复动作 
shell 会对 $((...)) 里的算术表达式进行计算, 再将计算后的结果放回到命令的文本内容

#readonly 可以使变量成为只读模式 readonly -p 
hour_per_day=24 ; readonly hour_per_day # 设为只读模式

#export 输出或改变 环境变量  export -p

${varName:-def} 如果varName 为null / 未定义 ,则返回默认值
${varName:=def} 如果varName 为null / 未定义 ,则将默认值赋给它,并返回

捕获变量未定义导致的错误 : ${varName:?message} # 如果varName 未定义, 将打印message
测试变量是否存在 :${varName:+def} # 如果varName存在 ,返回def ,否则 返回null 

${#varName} 返回varName 中字符的长度 

位置参数 : ${1} 得到命令行传来的第一参数 
$# 传来的参数总数


POSIX 规定的退出状态 :
	0 正常退出
	1-125 命令不成功的退出
	126 	命令找到了,但文件无法执行
	127 	命令找不到
	128 	命令因收到信号而死亡



if
elif 
else
fi

case ${1} in 
-f)
	... #执行接下来的命令 , 直到 ;; 为止 
	;;
-d | --directory) 
		...
		;;
*) 		
	...
	;; #这里的 ;; 可以不加
esac 

	
for	i 
# in *.sh  # 如果什么都不写, 默认 为  for i in "$@" ;遍历所有命令行参数 
do 
	...
done








	
	
