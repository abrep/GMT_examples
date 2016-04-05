#!/bin/bash
#  利用grdcontour模块绘制等值线图
#
# GMT模块 : gmtset, grdcontour, psbasemap, pscoast
# Unix命令: rm
#
ps=ex001.ps
gmt gmtset MAP_GRID_CROSS_SIZE_PRIMARY 0 FONT_ANNOT_PRIMARY 10p
# 绘制图中最外部的边框
gmt psbasemap -R0/6.5/0/7.5 -Jx1i -B0 -P -K > $ps

# 绘制位于下边的等值线图
gmt pscoast -Rg -JH0/6i -X0.25i -Y0.2i -O -K -Bg30 -Dc -Glightbrown -Slightblue >> $ps
## -C10: 每隔10绘制一条等值线
## -A50+f7p: 每隔50绘制给等值线加一个标注，标注大小为7p
## -Gd4i: 同一等值线上的相邻两个标注之间的距离大于4i
## -L-1000/-1: 只绘制-1000到-1之间的等值线
## -Wc: 常规等值线的线条属性
## -Wa: 带标注的等值线的线条属性
## -T
gmt grdcontour osu91a1f_16.nc -J -C10 -A50+f7p -Gd4i -L-1000/-1 -Wcthinnest,- -Wathin,- \
            -O -K -T+d0.1i/0.02i >> $ps
# 使用-L选项限制只绘制正等值线部分
gmt grdcontour osu91a1f_16.nc -J -C10 -A50+f7p -Gd4i -L-1/1000 -O -K -T+d0.1i/0.02i >> $ps

# 绘制位于上边的等值线图
gmt pscoast -Rg -JH6i -Y3.4i -O -K -B+t"Low Order Geoid" -Bg30 -Dc -Glightbrown \
            -Slightblue >> $ps
# 使用-L选项限制只绘制负等值线部分
gmt grdcontour osu91a1f_16.nc -J -C10 -A50+f7p -Gd4i -L-1000/-1 -Wcthinnest,- -Wathin,- \
            -O -K -T+d0.1i/0.02i+l >> $ps
# 使用-L选项限制只绘制正等值线部分
gmt grdcontour osu91a1f_16.nc -J -C10 -A50+f7p -Gd4i -L-1/1000 -O -T+d0.1i/0.02i+l >> $ps
rm -f gmt.*
