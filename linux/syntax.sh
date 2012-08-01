# 
变量 判断 重复动作 

shell 会对 $((...)) 里的算术表达式进行计算, 再将计算后的结果放回到命令的文本内容

#readonly 可以使变量成为只读模式 ; readonly -p 打印出当前所有 readonly 的变量 
hour_per_day=24 ; readonly hour_per_day # 设为只读模式

#export 输出或改变 环境变量  export -p

${varName:-def} 如果varName 为null / 未定义 ,则返回默认值
${varName:=def} 如果varName 为null / 未定义 ,则将默认值赋给它,并返回

#捕获变量未定义导致的错误 : 
${varName:?message} # 如果varName 未定义, 将打印message

#测试变量是否存在 :
${varName:+exists} # 如果varName存在 ,返回exists ,否则 返回null 

${#varName} 返回varName 中字符的长度 

位置参数 : ${1} 得到命令行传来的第一参数 
$# 传来的参数总数

POSIX 规定的退出状态 :
	0 正常退出
	1-125 命令不成功的退出
	126 	命令找到了,但文件无法执行
	127 	命令找不到
	128 	命令因收到信号而死亡

在 脚本里 可以使用 $1 $(10) 来取得 输入的参数 


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


