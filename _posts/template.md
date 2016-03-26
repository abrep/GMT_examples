---
layout: post
date: 2016-03-26
title: 这里是标题
description: 这里是描述
script: ex001.sh
figure: ex001.png
data: [osu91a1f_16.nc, file.cpt]
---

需要注意：

1. 文件名必须为 `YYYY-MM-DD-exnnn.md` 的格式，其中 `nnn` 是编号且递增
2. `script` 必须是 `exnnn.xx` ，可以是bash或perl或python，非bash脚本要注意修改 `highlight` 中的语言选项
3. `figure` 必须是 `exnnn.xx` ，可以是任意格式，建议用png
4. `data` 是当前示例所使用的数据，多个数据文件要在中括号内用逗号分隔

这里可以加文本，下面的highlight不要修改。


{% highlight bash %}
{% include {{page.script}} %}
{% endhighlight %}

这里可以加文本，下面的不要修改

![]({{ page.id }}/{{ page.figure }})
