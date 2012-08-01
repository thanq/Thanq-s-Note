# locate vimrc
注：这里用了locate命令。如果你第一次使用locate命令查找东西，系统会告知你应该先运行一下
“updatedb”。如果是这样，你就先花点时间运行一下。
# updatedb
然后
# locate vimrc #下面是vimrc的样例文件
发现该文件: /usr/share/vim/vim63/vimrc_example.vim 
# vim 设置自动缩进 
vim /etc/vimrc
#这是系统中公共的vim配置文件，对所有用户都有效。而在每个用户的主目录下，都可以自己建立私有的配置文件
syntax on
export TERM=xterm-color
set tabstop=4
set softtabstop=4
#2）设置缩进的空格数为4
set shiftwidth=4
#3）设置自动缩进：即每行的缩进值与上一行相等；使用 noautoindent 取消设置：
set autoindent
#4）设置使用 C/C++ 语言的自动缩进方式：
set cindent
#5）设置C/C++语言的具体缩进方式（以我的windows风格为例）：
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
#6）如果想在左侧显示文本的行号，可以用以下语句：
set nu