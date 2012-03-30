iterator标签主要是用于迭代输出集合元素,如list set map 数组等,在使用<s:iterator/>标签的时候有三个属性值得我们关注

1. value属性:可选的属性,value属性是指一个被迭代的集合,使用ognl表达式指定,如果为空的话默认就是ValueStack栈顶的集合.
2.id属性:可选属性, 是指集合元素的id
3.status属性:可选属性,该属性在迭代时会产生一个IteratorStatus对象,该对象可以判断当前元素的位置,包含了以下属性方法:

int getCount(); 迭代元素个数

int getIndex(); 迭代元素当前索引

boolean getFirst(); 是否为第一个

boolean getEven(); 是否为偶

boolean getLast(); 是否最后一个

bolean getOdd(); 是否为奇

由于iteratorstatus对象并不是ognl的根对象因此访问需要加上 #访问如下例子:

<s:iterator value="{'dd','bb','cc'}" status="st">

<s:if test="#st.odd">

<s:property value="#st.index"/>

</s:if>

</s:iterator>

此外:iterator也可以迭代map对象,map对象中有几对key-value 就迭代几次,分别使用
<s:property value=”key”/>
<s:property value=”value”/>

输出即可.

 

案例如下（WebWork标签）：实现奇偶行不同颜色显示

JSP中结果集显示如下：

<ww:iterator value="resultList" status="status">

<tr class="<ww:if test="#status.even">row-even</ww:if><ww:else>row-odd</ww:else>">

<td>

<ww:property value=""/>

</td>

</tr>

</ww:iterator>

样式表可以参考：

.row-even{background-color:#def7c2;}

.row-odd{background-color:#c8e7a6;}

除了使用#status.even判断是否偶数行外，还有其他几个属性可以使用：

#status.odd 是否奇数行

#status.count 当前行数

#status.index 当前行的序号，从0开始[#status.count=#status.index+1]

#status.first 是否第一行

#status.last 是否最后一行

#status.modules(int) 当前行数取模