
 
 
 -----------------------------------------------------------------------------------------------------------
 javascript获取网页URL地址及参数等

 

 

先看一个示例

用javascript获取url网址信息

<script type="text/javascript">
document.write("location.host="+location.host+"<br>");
document.write("location.hostname="+location.hostname+"<br>");
document.write("location.href="+location.href+"<br>");
document.write("location.pathname="+location.pathname+"<br>");
document.write("location.protocol="+location.protocol+"<br>");
</script>

执行 用javascript获取url网址信息 代码效果如下

location.host=www.vnde.cn
location.hostname=www.vnde.cn
location.href=http://www.vnde.cn/bc/2008/0306/article_1860.html
location.pathname=/bc/2008/0306/article_1860.html
location.protocol=http:

 

 

详细介绍 window.location方法获取URL

 

统一资源定位符 (Uniform Resource Locator, URL) 完整的URL由这几个部分构成：

scheme://host:port/path?query#fragment

 

scheme:通信协议

常用的http,ftp,maito等

 

host:主机

服务器(计算机)域名系统 (DNS) 主机名或 IP 地址。

 

port:端口号

整数，可选，省略时使用方案的默认端口，如http的默认端口为80。

 

path:路径

由零或多个”/”符号隔开的字符串，一般用来表示主机上的一个目录或文件地址。

 

query:查询

可选，用于给动态网页（如使用CGI、ISAPI、PHP/JSP/ASP/ASP.NET等技术制作的网页）传递参数，可有多个参数，用”&”符号隔开，每个参数的名和值用”=”符号隔开。

 

fragment:信息片断

字符串，用于指定网络资源中的片断。例如一个网页中有多个名词解释，可使用fragment直接定位到某一名词解释。(也称为锚点.)

 

示例： 

1, window.location.href

整个URl字符串(在浏览器中就是完整的地址栏)

返回值：http://www.2astudio.com:80/view.asp?id=209#cmt1323

 

2,window.location.protocol

URL 的协议部分

返回值：http:

 

3,window.location.host

URL 的主机部分，

返回值：www.2astudio.com

 

4,window.location.port

URL 的端口部分。如果采用默认的80端口(update:即使添加了:80)，那么返回值并不是默认的80而是空字符。

本例返回值:空

 

5,window.location.pathname

URL 的路径部分(就是文件地址)

返回值：/view.asp

 

6,window.location.search

查询(参数)部分。除了给动态语言赋值以外，我们同样可以给静态页面,并使用javascript来获得相信应的参数值

返回值：?id=209

 

7,window.location.hash

锚点

返回值：#cmt1323

 
 
 
 
 
 ------------------------
 
'预警信息'
'授信额度'
'贷款余额合计'
'正常类贷款'
'关注类贷款'
'不良贷款合计'
'次级类贷款'
'可疑类贷款'
'损失类贷款'
'不良贷款率(%)'
'贷款余额'
'限制行业贷款余额'
'限制行业贷款率(%)'
'限制行业不良贷款余额'
'限制行业不良贷款率(%)'
'逾期贷款余额'
'逾期贷款率(%)'
'90天以上逾期贷款余额'
'90天以上逾期贷款率(%)'
'违约人名称'
'违约人证件类型'
'违约人证件代码'
'与本企业关系'
'违约类型'
'违约天数'
 
 
 -------------------------
 
 
 
var cc = document.getElementById('cc');
var arr = cc.value.split('\n');
/*
for(var i = 0 ; i< arr.length ; i++){
    arr[i] = '+" '+arr[i].replace(/"/g,'\\\"')+' " '
}

var str = arr.join('\n');
cc.value=str ;
*/
for(var i = 0 ; i< arr.length ; i++){
    arr[i] ='+",'+arr[i].replace(/'/g,'')+'"'
}

var s = arr.join('\n');
cc.value=s;
 
 
 
 
 
 
 
 
 