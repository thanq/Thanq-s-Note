# 文件与文件系统 
unix 文件名中间表有 span ; shell中使用不方便 

# mount vbox 共享文件夹 
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