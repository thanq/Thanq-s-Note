
 
 
 -----------------------------------------------------------------------------------------------------------
 javascript��ȡ��ҳURL��ַ��������

 

 

�ȿ�һ��ʾ��

��javascript��ȡurl��ַ��Ϣ

<script type="text/javascript">
document.write("location.host="+location.host+"<br>");
document.write("location.hostname="+location.hostname+"<br>");
document.write("location.href="+location.href+"<br>");
document.write("location.pathname="+location.pathname+"<br>");
document.write("location.protocol="+location.protocol+"<br>");
</script>

ִ�� ��javascript��ȡurl��ַ��Ϣ ����Ч������

location.host=www.vnde.cn
location.hostname=www.vnde.cn
location.href=http://www.vnde.cn/bc/2008/0306/article_1860.html
location.pathname=/bc/2008/0306/article_1860.html
location.protocol=http:

 

 

��ϸ���� window.location������ȡURL

 

ͳһ��Դ��λ�� (Uniform Resource Locator, URL) ������URL���⼸�����ֹ��ɣ�

scheme://host:port/path?query#fragment

 

scheme:ͨ��Э��

���õ�http,ftp,maito��

 

host:����

������(�����)����ϵͳ (DNS) �������� IP ��ַ��

 

port:�˿ں�

��������ѡ��ʡ��ʱʹ�÷�����Ĭ�϶˿ڣ���http��Ĭ�϶˿�Ϊ80��

 

path:·��

���������/�����Ÿ������ַ�����һ��������ʾ�����ϵ�һ��Ŀ¼���ļ���ַ��

 

query:��ѯ

��ѡ�����ڸ���̬��ҳ����ʹ��CGI��ISAPI��PHP/JSP/ASP/ASP.NET�ȼ�����������ҳ�����ݲ��������ж���������á�&�����Ÿ�����ÿ������������ֵ�á�=�����Ÿ�����

 

fragment:��ϢƬ��

�ַ���������ָ��������Դ�е�Ƭ�ϡ�����һ����ҳ���ж�����ʽ��ͣ���ʹ��fragmentֱ�Ӷ�λ��ĳһ���ʽ��͡�(Ҳ��Ϊê��.)

 

ʾ���� 

1, window.location.href

����URl�ַ���(��������о��������ĵ�ַ��)

����ֵ��http://www.2astudio.com:80/view.asp?id=209#cmt1323

 

2,window.location.protocol

URL ��Э�鲿��

����ֵ��http:

 

3,window.location.host

URL ���������֣�

����ֵ��www.2astudio.com

 

4,window.location.port

URL �Ķ˿ڲ��֡��������Ĭ�ϵ�80�˿�(update:��ʹ�����:80)����ô����ֵ������Ĭ�ϵ�80���ǿ��ַ���

��������ֵ:��

 

5,window.location.pathname

URL ��·������(�����ļ���ַ)

����ֵ��/view.asp

 

6,window.location.search

��ѯ(����)���֡����˸���̬���Ը�ֵ���⣬����ͬ�����Ը���̬ҳ��,��ʹ��javascript���������Ӧ�Ĳ���ֵ

����ֵ��?id=209

 

7,window.location.hash

ê��

����ֵ��#cmt1323

 
 
 
 
 
 ------------------------
 
'Ԥ����Ϣ'
'���Ŷ��'
'�������ϼ�'
'���������'
'��ע�����'
'��������ϼ�'
'�μ������'
'���������'
'��ʧ�����'
'����������(%)'
'�������'
'������ҵ�������'
'������ҵ������(%)'
'������ҵ�����������'
'������ҵ����������(%)'
'���ڴ������'
'���ڴ�����(%)'
'90���������ڴ������'
'90���������ڴ�����(%)'
'ΥԼ������'
'ΥԼ��֤������'
'ΥԼ��֤������'
'�뱾��ҵ��ϵ'
'ΥԼ����'
'ΥԼ����'
 
 
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
 
 
 
 
 
 
 
 
 