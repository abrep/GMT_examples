#!/bin/bash
#   展示如何在图例中绘制表格
# GMT模块 : pscoast, pslegend, psxy
# Unix命令: cat, rm
#
ps=ex041.ps

gmt gmtset FONT_ANNOT_PRIMARY 12p FONT_LABEL 12p

# 绘制海岸线
gmt pscoast -R130W/50W/8N/56N -JM5.6i -B0 -P -K -Glightgray -Sazure1 -A1000 -Wfaint \
    -Xc -Y1.2i --MAP_FRAME_TYPE=plain > $ps
# 为美国(US)、古巴(CU)、墨西哥(MX)、加拿大(CA)填充不同的颜色
gmt pscoast -R -J -O -K -EUS+glightyellow+pfaint -ECU+glightred+pfaint \
    -EMX+glightgreen+pfaint -ECA+glightblue+pfaint >> $ps
# 绘制国界线
gmt pscoast -R -J -O -K -N1/1p,darkred -A1000/2/2 -Wfaint -Cazure1 >> $ps
# 绘制图中的标号
# 具体数据在my_data.txt中，my_color.cpt控制颜色，my_symbol中使用了自定义符号
gmt psxy -R -J -O -K -Skmy_symbol/0.1i -Cmy_color.cpt -W0.25p -: my_data.txt >> $ps
# 绘制图例，图例文件为my_table.txt
gmt pslegend -R0/6/0/9.1 -Jx1i -Dx3i/4.5i+w5.6i+jBC+l1.2 -C0.05i -F+p+gsnow1 -B0 -O \
    my_table.txt -X-0.2i -Y-0.2i >> $ps
rm gmt.*
