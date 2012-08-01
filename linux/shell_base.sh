#! /bin/awk -f        //  指明是 AWK 程序   
#!/bin/bash -x: 指明是bash 程序 同时打开 set -x
# 调试方式 -------------begin:
# 调试脚本的选项 可以在第一行设置

bash -x ./xx.sh #单行

set -x # 打开跟踪功能 显示被执行到的命令(每行) 和命令执行的结果 ; 在脚本中设置
	# some  command
set +x # 关闭跟踪功能

# -n 读脚本中的命令 但是不执行 ,用于检查脚本中的语法错误 
# -v 一边执行命令 , 一边将执行过的命令打印到标准错误输出
# 调试方式 -------------end:

man -k XXX		#Search for the specified string in *all* man pages.

/dev/null  : 输入该文件 的内容会被抛弃  > /dev/null : 流写入 null , 而不是标准输出流 
/dev/tty :  当程序打开该文件时, 会将它定位到一个终端  //  常用来提示输入密码 

wc -l 取到行数  == grep -c  ... # word counts 

stty -echo            #关闭自动打印输入字符的功能 
read pass < /dev/tty #读取密码 
stty echo            #打开自动打印输入字符的功能 // 常用来提示输入密码


grep  #列出符合匹配的每一行 
	man -k sed | grep ^sed # 取到所以以 sed 开头的  //egrep 对正则的支持更好  

查找文本 
	grep 
		grep -v a # -v  取反
	egrep  # extended grep 
		egrep 'a|b'
	fgrep	# fast grep :匹配固定字符串而不是正则表达式 
	
替换文本 
	sed # stream editor for filtering and transforming file 
	echo 111 | sed 's;1;2;'  # s; 定义 转义界定符 , 这里将转义字符 声明为 ; 
	echo 111 | sed 's;1;2;g'  # g 说明为全局替换  而不是每行只替换一个
	echo 111 | sed 's;\(1\);0\1;' # () 要添加转义  \1  : 第一组 
	echo 111 | sed 's;\(1\);0\1;2' #  匹配第二个
	
	通过 sed -e 可以一次替换多组   也可以用 sed -f  
 
	sed -n '/HTML/p' 显示 含有 HTML 这行  等效于 grep HTML ...
	sed -n '$p' 显示文本最后一行 , 很有用 ...
	
	sed -n '1,3p' ... 打印1 - 3 行 
	sed '/begin/,/end/ s;.;*;g'  ... 仅匹配范围之间的行 // begin , end  为 正则
	sed '/begin/! s;.;*;g'  ... 仅匹配 不匹配正则表达式(begin) 的行 
	
	sed '/^[^#]/d' ... 等效于 grep -v '^[^#]' ...
	
得到剪切文本
	cut 从输入中选择一个或多个字段 或一组数据
	cut -c 1,4-10  选择每行的第 n  个字符 
	cut -d : -f 2 ...  以 : 为分界符 的 第二 组   分界符默认为 tab 键
	
使用join 连接字段 
	join  -t' ' file1 file2
	以共同的一个键值 , 将文件内的记录加以结合

简单 AWK 	
	awk -F : '{ print $1 , $2} '	/etc/passwd # 以 : 为分隔符 , print 第一组 和 第二组 
	awk -F : -v 'OFS=**'  '{ print $1 , $2} '	/etc/passwd   #改变输出的分隔符 由 span 为 **  
		等效于
	awk 'BEGIN {FS=":" ; OFS="**"}
		{print $1 ,$2 }' etc/passwd

	awk 'NF>0  {print $0}  '  # 打印非空行 
	awk ' NF>0 '   没有 {}   默认action(行为)为打印 

查看重复
	uniq 去除重复行
	uniq -c 显示重复次数
	uniq -u 只显示非重复行
	uniq -d 只显示重复行

取得文件前几行
	head -n 2 xxx
	awk 'FNR<=2' xxx
	sed 2q
尾几行
	tail -n 2 xxx
	tail -n 2 -f xxx  : 进入循环 : 如果xxx 有改变 就取出新数据 , 常用来观察不断增长的日志文件

排序	
	cat /etc/group | sort -t: -k3nr  | head  -n 10 
		等效于
	cat /etc/group | sort -t: -k3,3nr  | head  -n 10 
	#-t: 用:分割 -k3nr 以第3列排序  , 该列为数字类型 , 取反序(desc)
	#用 : 分割 的 第 3 列 排序 , 指定为数字类型 , 和反序 i 


trap # 管理操作系统信号



